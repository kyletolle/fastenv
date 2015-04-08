require "fastenv/version"

class Fastenv
  def self.method_missing(symbol, *args, &block)
    env_var = symbol.to_s.upcase

    if ENV.include?(env_var)
      ENV[env_var]

    else
      raise NameError, "Couldn't find the environment variable named #{env_var}"
    end
  end
end

