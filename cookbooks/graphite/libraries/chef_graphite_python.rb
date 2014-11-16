module ChefGraphite
  class PythonWriter

    def initialize(config, options = {})
      @config = config || Hash.new
      @options = options
    end

    def to_s
      lines = @config.map { |key, value| render_line(key, value) }
      lines.join("\n").concat("\n")
    end

    def pythonize(value)
      case value
      when NilClass
        "''"
      when TrueClass, FalseClass
        value.to_s.capitalize
      when String, Symbol
        "'#{value}'"
      when Array
        a = value.map { |i| pythonize(i) }.join(", ")
        "[#{a}]"
      when Hash
        h = value.map { |k, v| "#{pythonize(k)}: #{pythonize(v)}" }.join(", ")
        "{#{h}}"
      else
        value
      end
    end

    private

    def render_line(key, value)
      "#{upcase(key)} = #{pythonize(value)}"
    end

    def upcase(key)
      if @options[:upcase_root_keys]
        key.to_s.upcase
      else
        key.to_s
      end
    end

  end
end
