require 'test_helper'

class ImportsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imports)
  end

  test "should create import record" do
    data_file = fixture_file_upload('dados.txt','text/plain')
    assert_difference('Import.count', difference = 4) do
      post :save, file: data_file
    end
    assert_redirected_to root_path
  end

  test "should send a blank file to upload" do
    post :save
    assert_not_nil flash[:notice]
    assert_equal I18n.t(:invalid_upload_file), flash[:notice]
  end


  test "invalid if blank file" do
    data_file = fixture_file_upload('dados_vazio.txt','text/plain')
    post :save, file: data_file
    assert_not_nil flash[:notice]
    assert_equal I18n.t(:blank_upload_file), flash[:notice]
  end

  test "invalid if only columns name in the file" do
    data_file = fixture_file_upload('dados_sem_registro.txt','text/plain')
    post :save, file: data_file
    assert_not_nil flash[:notice]
    assert_equal I18n.t(:only_column_upload_file), flash[:notice]
  end

end
