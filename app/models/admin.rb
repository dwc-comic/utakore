class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :users
  has_many :cart_items

 def leave
    #leave_atに退会時刻を追記
    update_attribute(:leave_at, Time.current)

    # また、userのメールアドレスの頭にleave_atを追加する。
    # メールアドレスを変更すると原則確認メールが送信されるため、
    # 送信をスキップすることを宣言した上でupdateする。
    new_email = self.leave_at.to_i.to_s + '_' + self.email.to_s
    self.skip_reconfirmation!
    update_attribute(:email, new_email)

    # また、social_profilesが存在する場合はuidの頭にもleave_atを追加する
    # fb,twitter両方連携されている場合があるため、each doしている。
    social_profiles = self.social_profiles
    social_profiles.each do |sp|
      new_uid = self.leave_at.to_i.to_s + '_' + sp.uid.to_s
      sp.update_attribute(:uid, new_uid)
    end
  end

end
