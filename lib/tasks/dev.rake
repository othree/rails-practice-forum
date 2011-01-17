namespace :dev do
  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", :setup]
  
  desc "Setup system data"
  task :setup => :environment do
      puts "Create system user"
      u = User.new( :login => "root", :password => "password", :password_confirmation => "password", :email => "root@example.com", :name => "管理員")
      u.is_admin = true
      u.save!
      
      Forum.populate(3) do |forum|
        forum.name = 'Forum' + forum.id.to_s

        Post.populate(50) do |post|
          post.title = 'Article ' + post.id.to_s
          post.content = 'Article Content'
          post.forum_id = forum.id
        end
      end

  end
end
