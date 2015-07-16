class Admin::BaseController < ApplicationController
 http_basic_authenticate_with name: "banane", password: "baba"
 layout 'admin/base'
end
