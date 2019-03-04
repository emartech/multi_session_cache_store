class MultiSessionCacheStore < ActionDispatch::Session::AbstractStore
  VERSION = "0.1.0"

  def initialize(app, options = {})
    @cache = options[:cache] || Rails.cache
    options[:expire_after] ||= @cache.options[:expires_in]
    @param = options[:param]
    @serializer = options[:serializer]
    super
  end

  def find_session(env, sid)
    sid ||= generate_sid
    session = @serializer.parse(@cache.read(cache_key(env, sid)) || "{}")
    [sid, session]
  end

  def write_session(env, sid, session, options)
    key = cache_key(env, sid)
    if session
      @cache.write(key, @serializer.dump(session), expires_in: options[:expire_after])
    else
      @cache.delete(key)
    end
    sid
  end

  def delete_session(env, sid, options)
    @cache.delete(cache_key(env, sid))
    sid
  end

  private

  def cache_key(env, sid)
    subsession_id = env.params[@param] || generate_sid
    "_session_id:#{sid}:#{subsession_id}"
  end
end
