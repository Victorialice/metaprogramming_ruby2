require 'test/unit'
require_relative "using"

class TestUsing < Test::Unit::TestCase
	class Resource
		def dispose
			@disposed = true
		end

		def disposed?
			@disposed
		end
	end


	def test_disposes_of_resources
		r = Resource.new
		assert_raises(Exception){
			using(r){
				raise Exception
			}
		}

		assert r.disposed?
	end
end


module Kernel
	def using(resource)
		begin
			yield
		ensure
			resource.dispose
		end
	end
end