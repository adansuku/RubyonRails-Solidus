Devise.secret_key = "572ef2286c79b7b79ed8be8f00b5c9f9fcb966ce91f3c93fd18419514b8d69377e393dd875a59fbef8395a5b354a5b7c1c7b"
Warden::Manager.after_set_user except: :fetch do |user, auth, opts|
    Track::User.new(user, auth.request).logged_in
end
Warden::Manager.after_set_user except: :fetch do |user, auth, opts|
    Track::User.new(user, auth.request).logged_in
end