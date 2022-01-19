class WithdrawMoneyService

  BANK_URL = 'http://bank-examlpe.com'.freeze

  def self.call(user, amount)
    amount_i = amount.to_i
    code = HTTParty.post(BANK_URL, body: { amount: amount_i}).code
    if code.to_s != '200' || user.amount.to_i < amount_i
      :error
    else
      user.amount -= amount_i
      user.save!
      :success
    end
  end
end
