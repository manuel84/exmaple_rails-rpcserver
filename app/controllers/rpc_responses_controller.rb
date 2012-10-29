class RpcResponsesController < ApplicationController
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

  # GET /rpc_responses/new
  # GET /rpc_responses/new.json
  def new
    @rpc_response = RpcResponse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @rpc_response }
    end
  end

  # GET /rpc_responses/1/edit
  def edit
    @rpc_response = RpcResponse.find(params[:id])
  end

  exposes_xmlrpc_methods :method_prefix => "sample."

  add_method 'sample.sumAndDifference' do
    params[:rpc_response] = {} unless params[:rpc_response]
    params[:rpc_response][:methodName] = params[:methodCall][:methodName]
    params[:rpc_response][:params] = params[:methodCall][:params][:param].collect { |p| p[:value][:string] }.join("||#||")
    return '2'
  end

  # POST /rpc_responses
  # POST /rpc_responses.json
  def create
    logger.debug params.inspect
    params[:rpc_response] = {} unless params[:rpc_response]
    params[:rpc_response][:methodName] = params[:methodCall][:methodName]
    params[:rpc_response][:params] = params[:methodCall][:params][:param].collect { |p| p[:value][:string] }.join("||#||")
    @rpc_response = RpcResponse.new(params[:rpc_response])

    respond_to do |format|
      if @rpc_response.save
        format.html { redirect_to @rpc_response, :notice => 'Rpc response was successfully created.' }
        format.json { render :json => @rpc_response, :status => :created, :location => @rpc_response }
      else
        format.html { render :action => "new" }
        format.json { render :json => @rpc_response.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rpc_responses/1
  # PUT /rpc_responses/1.json
  def update
    @rpc_response = RpcResponse.find(params[:id])

    respond_to do |format|
      if @rpc_response.update_attributes(params[:rpc_response])
        format.html { redirect_to @rpc_response, :notice => 'Rpc response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @rpc_response.errors, :status => :unprocessable_entity }
      end
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
end
