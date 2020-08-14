namespace :sellers, except: %i[new edit], defaults: { format: :json } do
  # === 유저 API
  #
  resources :users do
    #
    scope module: :users do
      resource :seller_info, controller: 'seller_infos'
      resource :store_info, controller: 'store_infos'

      # === 관심사 태그 API
      #
      # 관심사 태그와 셀러를 연결/해제 하는 행동을 컨트롤 합니다
      resources :interest_tags, controller: 'interest_tags'

      # === 정산 API
      #
      resources :settlement_statements, controller: 'settlement_statements'
      resources :account_infos, controller: 'account_infos'
      resources :item_sold_papers, controller: 'item_sold_papers' do
        get 'sum', on: :collection
      end
    end
  end

  # === 상품 API
  #
  resources :products, only: %i[index show] do
    collection do
      match 'search' => 'products#search', via: [:get, :post], as: :search
      match 'category' => 'products#category', via: [:get, :post], as: :category
    end

    resource :select, only: %i[create destroy], controller: 'products/selects'
  end
end
