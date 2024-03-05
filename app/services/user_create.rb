class User::Create < ActiveInteraction::Base
  hash :params do
    string :name
    string :surname
    string :patronymic
    string :email
    integer :age
    string :nationality
    string :country
    string :gender
    string :skills
    array :interests
  end
  

  def execute
    return unless user_params_correct?(params)

    user_full_name = "#{params[:surname]} #{params[:name]} #{params[:patronymic]}"

    user_params = params.except(:interests, :skills)
    user = User.create(user_params.merge(fullname: user_full_name))

    user.save

    add_skills_to_user(user, params[:skills])
    add_interests_to_user(user, params[:interests])
  end

  def user_params_correct?(params)
    return nil if User.find_by(email: params[:email])
    return nil unless (1..90).include? params[:age]
    return %w[male female].include? params[:gender]
  end

  def add_skills_to_user(user, skills)
    skill_names = skills.split(',').uniq
    user_skills = Skill.where(name: skill_names)
    user.skills << user_skills
  end

  def add_interests_to_user(user, interests)
    user_interests = Interest.where(name: interests.uniq)
    user.interests << user_interests
  end
end