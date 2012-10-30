class RpcResponsesController < ApplicationController
  exposes_xmlrpc_methods :method_prefix => "monitor."
  
  def listMethods
    do_params
    2
  end
  
  def methodHelp(mString)
    do_params
    2
  end
  
  def methodSignature(mString)
    do_params
    2
  end

  def listActiveUsers
    do_params
    2
  end
  
  def checkActiveUser(uString)
    do_params
    2
  end

  def getLoadAverages
    do_params
    2
  end

  def getDiskSpace
    do_params
    2
  end

  def getSelectedDiskSpace(uString)
    do_params
    2
  end
   
  # GET /rpc_responses
  # GET /rpc_responses.json
  def index
    @rpc_responses = RpcResponse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @rpc_responses }
    end
  end

  # GET /rpc_responses/1
  # GET /rpc_responses/1.json
  def show
    @rpc_response = RpcResponse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @rpc_response }
    end
  end

  # DELETE /rpc_responses/1
  # DELETE /rpc_responses/1.json
  def destroy
    @rpc_response = RpcResponse.find(params[:id])
    @rpc_response.destroy

    respond_to do |format|
      format.html { redirect_to rpc_responses_url }
      format.json { head :no_content }
    end
  end
  
  protected
  
  def do_params
    params[:rpc_response] = {} unless params[:rpc_response]
    params[:rpc_response][:methodName] = params[:methodCall][:methodName]
    params[:rpc_response][:params] = params[:methodCall][:params][:param].collect { |p| p[:value][:string] }.join("||#||")
  end
end
