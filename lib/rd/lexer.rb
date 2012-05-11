module RD
	Pattern = Struct.new(:name, :pattern, :block)

	class Token
		def initialize(pattern_name, value)
			@data = {pattern_name, value}
		end
	end
		
	class Lexer
		def initialize(&block)
			@patterns = []
			....
			instance_eval(&block)
		end

		def lex(string)
			@tokens = []
			pos = 0
			len = string.length - 1
			until pos > len
				m = @patterns.any? do |p|	
					n = p.pattern.match(string, pos)	
					if n then
						name = p.name
						name = n[0] unless name
						name = name.to_s

						@tokens << Token.new(name, p.block.call(n.to_s));
						pos += n[0].length
						true
					else 
						false
					end
				end 
				if (m === true)
					raise "No ha cazado"
		
			end			
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
