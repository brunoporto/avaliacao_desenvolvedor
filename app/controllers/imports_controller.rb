class ImportsController < ApplicationController

  #before_action :set_imports, only: [:show, :edit, :update, :destroy]

  def index
    @imports = Import.all
  end

  def save
    form_params = get_params
    if form_params[:file].nil?
      flash[:notice] = t(:invalid_upload_file)
    else
      text_file = form_params[:file].read
      flash[:notice] = t(:blank_upload_file) if text_file.blank?
      flash[:notice] = t(:only_column_upload_file) if text_file.lines.count==1

      #UPLOAD
      opFile = File.open(Rails.root.join('public', form_params[:file].original_filename), 'wb')
      opFile.write(text_file)
      opFile.close unless opFile.nil?

      #SAVE ON DATABASE
      line_num=0
      text_file.each_line do |line|
        #line 0 equal columns names
        if line_num > 0
          line = line.force_encoding("UTF-8")
          columns = line.split(/\t/)
          #[0]Comprador	[1]descrição	[2]Preço Uniário	[3]Quantidade	[4]Endereço	[5]Fornecedor
          buyer = Buyer.find_or_create_by!(name: columns[0])
          supplier = Supplier.find_or_create_by!(name: columns[5])
          Import.create!({
                             buyer_id: buyer.id,
                             description: columns[1],
                             price: columns[2],
                             quantity: columns[3],
                             address: columns[4],
                             supplier_id: supplier.id
                         })
        end
        line_num += 1
      end
      flash[:notice] = t(:success_import_message) if flash[:notice].nil?
    end
    redirect_to root_path
  end

  private
  def get_params
    params.permit(:file)
  end



end
