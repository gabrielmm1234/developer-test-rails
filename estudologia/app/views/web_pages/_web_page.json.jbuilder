json.extract! web_page, :id, :title, :description, :body, :author, :created_at, :updated_at
json.url web_page_url(web_page, format: :json)
