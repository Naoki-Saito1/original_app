validates :name, presence: true  
  validates :name, length: { maximum: 30 }
  validates :status, presence: true  
  validates :birth_date, presence: true  
  validates :body, length: { maximum: 800 }
  validates :address, presence: true

====================================

....................................
<div class="container">
  <div class="row">
    <div class="col-md-6 prof-wrapper">
<h1>プロフィール</h1>
    <div class="prof-body">
     <div class="prof-name">
        <h2>
        ユーザーネーム:
        <strong><%= @profile.name %></strong>
          
        </h2>
      </div>
      <div class="prof-image">
        <% if @profile.image? %>
          <%= image_tag @profile.image.url, style:'width:100%' %>
        <% else %>
          <%= image_tag asset_path("no_image.jpg"), style:'width:100%' %>
        <% end %>
      </div>
    </div>
    <div class="profile-info">
      <p>
        <% if  @profile.gender_check == true  %>
           性別非公開
          <% else %>
          <%= @profile.gender if  @profile.gender.present?%>
        <% end %>
        <% if  @profile.birth_date_check == true %>
        年齢非公開
        <% elsif @profile.birth_date.present? %>

                /<%= (Date.today.strftime('%Y%m%d').to_i - @profile.birth_date.strftime('%Y%m%d').to_i) / 10000 %>歳/ 
        <% end %>
        <% if @profile.address_check == true %>
        居住地非公開
        <% else %>
                <%= @profile.address if @profile.address.present? %>
        <% end %>
      </p>
    </div>
    <div class="prof-status">
    
    <p>
      <% if @profile.body.present? %>
        <%= @profile.body %>
      <% end %>
    </p>
    </div>
    <div class="prof-message">
      <% if @profile.user_id == current_user.id %>
          <%= link_to 'Edit', edit_profile_path(@profile) %> <br>

         <% if @profile.link.present? %>
          <%= link_to 'sns編集', edit_link_path(@profile.link.id) %> 
         <% else %>
          <%= link_to 'sns', new_link_path %> 
         <% end %>
         

        <% else %>
          <p><%= link_to 'メッセージを送る', conversations_path(sender_id: current_user.id, recipient_id: @profile.user.id), method: :post, class: "btn btn-warning" %></p>
        <% end %>
        <% if current_user.try(:admin?) %>
          <%= link_to "管理者ページ", rails_admin_path %>  
      <% end %>
    </div>
    </div>


  </div>
</div>



# ここからcss
.gender{
  display: flex;
}
.required:after {
  margin-left: 1.0em;
  padding: 0px 6px 0px 6px;
  border-radius: 4px;
  font-size: 0.6em;
  color: white;
  background-color: #C44;
  content: "必須";
}



// _form

.prof-body{
  padding-top: 3rem;
}
span .name {
  background: linear-gradient(transparent 70%, #a7d6ff 70%);
  
}

.prof-wrapper{
  margin: 100px 0 100px 0;
  height: 600px;
  
  
}
.prof-image{
  width: 200px;
  height: 200px;
  margin:  0 auto;
}
.profile-info{
  padding-top: 2rem;
}

.profile-info p{
  font-size: 1rem ;
}
.prof-status p{
  font-size: 1rem;
}





.prof-pf{
  margin: 100px 0 100px 0;
  height: 600px;
 
  overflow: scroll
}




.prof-card{
  height: 380px;
  overflow: scroll;
}
.prof-index-image{
  background-color: darkgrey;
  text-align: center;
}

.no-gutters{
  max-height: 200px;
}
.card{
  margin-left: 10px;
}
.prof-content{
  height: 200px;
  width: 450px;
  padding: 5px 0 5px 10px;

}







<div class="col-md-6">
<div class="prof-pf">

<div class="card" style="max-width: 450px" >
<% if  @profile.user.portfolios.present?%>
<% @profile.user.portfolios.each do |profile| %>
<div class="prof-content">
<div class="row no-gutters">

  <div class="col-md-5">
  <% if profile.portfolio_image.present? %>
        <%= image_tag profile.portfolio_image.url, size: '180x180' %>
      <% else %>
        <%= image_tag asset_path("no_image.png"), size: '180x180'  %>
      <% end %>
</div>

<div class="col-md-7">
  <div class="card-body">
    <p>
        <strong>タイトル:</strong>
        <%= profile.portfolio_title %>
      </p>
      <div class="pf-framework">
      <p><strong>制作に使用したスキル</strong></p>
      <ul class="framework">
          <% profile.frameworks.each do |p| %>
        <% if p.framework_name.present? %>
        <li><%= p.framework_name %>/</li>
        <% end %>
          <% end %>
        </ul>
      </div>
      <p>

   <small class="text-muted"><%= profile.created_at.strftime("%Y-%m-%d") %></small></p>
  </div>
</div>
</div>
<% end %>
<% else %>
<h1>投稿はまだありません</h1>
<% end %>
</div>
</div>
</div>
</div>



</div>
</div>


<% if @profile.link.present? %>
  <div class="social-links">
      <%= link_to @profile.link.github, target: :_blank do %>
        <i class="fab fa-github social-icon"></i>
      <% end %>
      <%= link_to @profile.link.twitter, do %>
        <i class="fab fa-twitter social-icon"></i>
      <% end %>
      <%= link_to @profile.link.qiita, target: :_blank do %>
        <i class="fab fa-facebook-square"></i>
      <% end %>
  </div>
<% end %>





=========================================














if signed_in?
  redirect_to profiles_path
else
@user = User.new
end

  <div class="sns">
  <p>
    <%= @profile.twitter %>
  </p>
  
  <p>
    <%= @profile.github %>
  </p>
  
  <p>
    <%= @profile.qiita %>
  </p>
  </div>
  



  ---------------------
name_or_birth_date_or_detail_cont
<%= link_to 'Back', profiles_path %>

<li><%= link_to 'Show', portfolio %></li>
<li><%= link_to 'Edit', edit_portfolio_path(portfolio) %></li>
          <li><%= link_to 'Destroy', portfolio, method: :delete, data: { confirm: 'Are you sure?' } %></li>

          .row{
            margin-top: 5rem;
          }
          .col-2{
          
            
          }
          .side-bar{
            position: fixed;
            top: 5rem;
          }
          .nav{
            padding-left: 200px;
          }




          <div class="nav">
 <% if user_signed_in? %>
   <%= link_to "ログアウト", destroy_user_session_path, method: :delete %>
 <% else %>
   <%= link_to "新規登録", new_user_registration_path %>
   <%= link_to "ログイン", new_user_session_path %>
 <% end %>
 </div>



 <nav class="navbar navbar-expand-lg navbar-light bg-dark">
  <a class="navbar-brand text-white" href="#">Navbar</a>
  <button class="navbar-toggler bg-white" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link text-white" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="#">Pricing</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>
    </ul>
  </div>
</nav>




================================================







<tbody>
  <div class="container">
    <div class="row">
    <% @portfolios.each do |portfolio| %>
    <div class="col-sm-4">
      <div class="portfolio-wrapper">
        <ul class="portfolio-ul">
         <li><%= portfolio.user.profile.name%></li>
         <li>
         <% if portfolio.portfolio_image.url.present? %>
           <div><%= link_to image_tag(portfolio.portfolio_image.url, style:'width:100px', class: "icon"), portfolio %></div>
         <% else %>
           <%= link_to image_tag(asset_path("no_image.jpg"), class: "icon"), portfolio %>
         <% end %>
          </li>
          <li><%= portfolio.portfolio_title %></li>
          <li><%= portfolio.portfolio_language %></li>
          <% portfolio.frameworks.each do |p| %>
            <% if p.framework_name.present? %>
              <li><%= p.framework_name %></li>
            <% end %>
            <% end %>
          <li><%= portfolio.created_at.strftime("%Y-%m-%d") %></li>
        </ul>
      </div>
    </div>
    <% end %>
    </div>
  </div>

  </tbody>
<br>

<%= link_to 'New Portfolio', new_portfolio_path %>



-----------------------------------------------------------------------

<p>
  <strong>Portfolio title:</strong>
  <%= @portfolio.portfolio_title %>
</p>


<%= link_to 'Back', portfolios_path %>

<div class="card" style="width: 40rem;">
  <% if @portfolio.portfolio_image? %>
  <%= image_tag @portfolio.portfolio_image.url, size: '256x160' %>
<% else %>
  <%= image_tag asset_path("no_image.jpg")  %>
<% end %>
  <div class="card-body">
  <p>
  <strong>Portfolio language:</strong>
  <%= @portfolio.portfolio_language %>
</p>
<ul class="framework">
<% @portfolio.frameworks.each do |p| %>
  <% if p.framework_name.present? %>
    <li><%= p.framework_name %></li>
<% end %>
<% end %>
</ul>
<p>
  <strong>Portfolio body:</strong>
  <%= @portfolio.portfolio_body %>
</p>

<p>
  <strong>Portfolio github:</strong>
  <%= @portfolio.portfolio_github %>
</p>

<p>
  <strong>Portfolio url:</strong>
  <%= @portfolio.portfolio_url %>
</p>
    <% if @portfolio.user_id == current_user.id %>
  <%= link_to 'Edit', edit_portfolio_path(@portfolio) %>
  <%= link_to 'Destroy', @portfolio, method: :delete, data: { confirm: 'Are you sure?' } %>
<% else %>
<div id="likes_buttons<%= @portfolio.id %>">
   <%= render partial: 'favorites/favorite', locals: { portfolio: @portfolio, favorite: @favorite} %>
 </div>
<% end %>
  </div>
</div>



<%= sort_link(@q, 'favorites_favorites.count', "いいね") %>

ransacker :favorites_count do
  query = '(SELECT COUNT(favorites.portfolio_id) FROM favorites where favorites.portfolio_id = portfolios.id GROUP BY favorites.portfolio_id)'
  Arel.sql(query)
 end
end




@portfolios = Portfolio.includes(:favorite_users).sort {|a,b| b.favorite_users.size <=> a.favorite_users.size}

def sort
  self.includes(:favorite_users).sort {|a,b| b.favorite_users.size <=> a.favorite_users.size}  
 end

 if current_user.profile.id.present? || nil?
  redirect_to portfolios_path
elsif current_user.profile.id.nil?
  redirect_to  profile_path
end