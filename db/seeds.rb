User.delete_all
Classroom.delete_all
Assignment.delete_all
Question.delete_all
Tag.delete_all
Response.delete_all

# Table name: answers
#
#  id          :integer          not null, primary key
#  text        :text
#  is_correct  :boolean
#  question_id :integer

# Table name: Assignments
#  description :string(255)
#  subject     :string(255)
#  source_type :string(255)
#  source_id   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Table name: classrooms
#
#  id         :integer          not null, primary key
#  subject    :string(255)
#  teach_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#homework
#  id           :integer          not null, primary key
#  instruction  :text
#  user_id      :integer
#  classroom_id :integer
#  grade        :string(255)
#  due_date     :date
#

# Table name: questions
#
#  id            :integer          not null, primary key
#  text          :string(255)
#  assignment_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null

# Table name: response
#  id          :integer          not null, primary key
#  answer      :string(255)
#  is_correct  :boolean
#  homework_id :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  is_teacher      :boolean
#  password_digest :string(255)
#  address         :text
#  phone           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

s1 = User.create(name: 'jeff', email: 'jeffkatzy@gmail.com', is_teacher: false, address: '41 Kingsclere Dr. Southampton PA 18966', phone: '215-499-7415', password: 'a', password_confirmation: 'a')
s2 = User.create(name: 'simon', email: 'nomis@gmail.com', is_teacher: false, address: '41 Kingsclere Dr. Southampton PA 18966', phone: '215-499-7415', password: 'a', password_confirmation: 'a')
t1 = User.create(name: 'chyld', email: 'chyld@gmail.com', is_teacher: true, address: 'General Assembly', phone: '215-364-8145', password: 'a', password_confirmation: 'a')


c1 = Classroom.create(subject: 'Math')
c1.users = [s1, s2, t1]



