# frozen_string_literal: true

RSpec.describe CategoriesController, type: :controller do
  let!(:user) { create(:valid_user) }
  let!(:category) { create(:valid_category) }

  let!(:image) { create(:valid_image) }
  let!(:like) { create(:valid_like) }
  let!(:comment) { create(:valid_comment) }

  context 'when user NOT sign in' do
    context 'GET #index' do
      it 'returns successful response' do
        get :index
        expect(response).to be_ok
      end
      it 'NOT creates any .activity record' do
        get :index
        expect(Activity.count).to eq(0)
      end
    end

    context 'GET #show' do
      it 'returns successful response' do
        get :show, params: { id: category.id }
        expect(response).to be_successful
      end
      it 'NOT creates any .activity record' do
        get :show, params: { id: category.id }
        expect(Activity.count).to eq(0)
      end
    end
    context 'GET #new' do
      it 'redirects to sigh_in form' do
        get :new
        expect(response).to redirect_to('http://test.host/users/sign_in')
      end
      it 'NOT creates any .activity record' do
        get :new
        expect(Activity.count).to eq(0)
      end
    end
  end

  context 'when user sign in' do
    before do
      sign_in user
    end
    context 'GET #index' do
      it 'returns successful response' do
        get :index
        expect(response).to be_successful
        puts category.slug
      end
      it "creates activity record with 'showing_index_category' action" do
        get :index
        expect(Activity.last.action).to eq('showing_index_category')
      end
    end

    context 'GET #show' do
      it 'returns successful response' do
        get :show, params: { id: category.id }
        expect(response).to be_successful
      end

      it "creates .activity record with 'showing_category' action" do
        get :show, params: { id: category.id }
        expect(Activity.last.action).to eq("showing_category_#{category.slug}")
      end
    end

    context 'GET #new' do
      it 'returns successful response' do
        get :new
        expect(response).to be_successful
      end
    end

    context '#create' do
      before do
        post :create, params: { category: { name: Faker::DcComics.hero,
                                            description: Faker::ChuckNorris.fact,
                                            user_id: user.id } }
      end

      it 'increases category counter by 1' do
        expect { create(:valid_category) }.to change { Category.count }.by(1)
      end

      it "creates .activity 'cat_ctreation' after creation" do
        expect(Activity.last.action).to eq('cat_creation')
      end

      it "after #create redirect to 'categories/index'" do
        expect(response).to redirect_to(categories_path)
      end

      it "if #create fails, render template #new'" do
        post :create, params: { category: { name: nil,
                                            description: nil,
                                            user_id: nil } }
        expect(response).to render_template(:new)
      end
    end

    context '#destroy' do
      it '#delete database record' do
        expect { category.destroy }.to change { Category.count }.by(-1)
      end

      it "redirects to 'categories/index'" do
        delete :destroy, params: { id: Category.last.id }
        expect(response).to redirect_to(categories_path)
      end
    end

    context '#TOP CATEGORIES' do
      it 'with having 1 image, 1 like and 1 comment, category has rank 3' do
        expect { get :top }.to change { Category.last.rank }.by(3)
      end

      it 'returns successful response' do
        get :top
        expect(response).to be_successful
      end

      it 'after execute creates 5 categories
          and rank of previous is greater then next' do
        10.times do
          Category.create!(name: Faker::DcComics.hero,
                           description: Faker::ChuckNorris.fact,
                           user_id: user.id)
        end
        20.times do
          Image.create!(title: Faker::Games::HeroesOfTheStorm.hero,
                        user_id: user.id,
                        category_id: rand(Category.first.id..Category.last.id),
                        picture: image.picture)
        end
        30.times do
          Like.create!(user_id: user.id,
                       image_id: rand(Image.first.id..Image.last.id))
        end
        30.times do
          Comment.create!(commenter: user.name,
                          text: Faker::Lorem.sentence(6),
                          user_id: user.id,
                          image_id: rand(Image.first.id..Image.last.id))
        end
        get :top
        expect(assigns(:top_categories).count).to eq(5)
        expect(assigns(:top_categories)[0].rank)
          .to be >= assigns(:top_categories)[1].rank
        expect(assigns(:top_categories)[1].rank)
          .to be >= assigns(:top_categories)[2].rank
        expect(assigns(:top_categories)[2].rank)
          .to be >= assigns(:top_categories)[3].rank
        expect(assigns(:top_categories)[3].rank)
          .to be >= assigns(:top_categories)[4].rank
      end
    end
  end
end
