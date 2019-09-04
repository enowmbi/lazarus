FactoryBot.define do 
  factory :finance_transaction do 
    title {"Payment of Fees "}
    description {"Payment of Fees - description"}
    amount{100000}
    fine_included{false}
    finance_transaction_category
    student
    finance_fees
    transaction_date {Time.now}
    fine_amount{0}
    finance_id {1}
    finance_type {"finance type"}
    employee
    payee_type {"debit"}
    receipt_no {"12345"}
    voucher_no {"12345"}
    school
  end
end
