module RD
	Pattern = Struct.new(:name, :pattern, :block)

	class Token
		def initialize( pattern, )
			@value = {}
		end
	end
		
	class Lexer
		def initialize(&block)
			@patterns = []
		
			instance_eval(&block)
		end

		def lex(expr)
			# Necesitamos un puntero
			# A la expresion regular le añadimos \G que es un ancla a la ultima posicion que cazó
		end

		def white(expr, &block)

		end
		
		def token(pattern, &block)
			if (pattern.is_a? Hash)
				pattern, name = pattern.each.next 					
			elsif (pattern.is_a? Regexp)
				name = nil								
			else 
				raise "Not supported token definition (incorrect argument type)"
			end

			block = Proc.new { |m| m } if block.nil?
			@patterns << Patern.new(name, 
				Regexp.new('\\G(?:' + pattern.source + ')', pattern.options), 
				block);					

		end
	end
end
