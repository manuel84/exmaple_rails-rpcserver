class RpcResponse < ActiveRecord::Base
  attr_accessible :methodName, :params, :request, :response
end
