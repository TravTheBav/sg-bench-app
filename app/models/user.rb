class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  

  has_many :build_orders, dependent: :destroy
  has_many :attack_benchmarks, dependent: :destroy

  def admin?
    admin
  end
end
