FactoryBot.define do 
  factory :monthly_payslips do 
    salary_date { 2.years.ago }
    employee
    payroll_category
    amount {"100"}
    is_approved { true }
    approver_id {employee.id}
    is_rejected { false }
    rejector_id {employee.id}
    reason {"Monthly payout"}
    # school
    remark {"This is a remark"}
  end
end
