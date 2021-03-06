#Fedena
#Copyright 2011 Foradian Technologies Private Limited
#
#This product includes software developed at
#Project Fedena - http://www.projectfedena.org/
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

class EmployeeController < ApplicationController
  before_action :login_required,:configuration_settings_for_hr
  filter_access_to :all
  before_action :protect_other_employee_data, :only => [:individual_payslip_pdf,:timetable,:timetable_pdf,:profile_payroll_details,\
      :view_payslip ]
  before_action :limit_employee_profile_access , :only => [:profile,:profile_pdf]

  def add_category
    @categories = EmployeeCategory.where("status = 1").order("name asc")
    @inactive_categories = EmployeeCategory.where("status = 0")
    @category = EmployeeCategory.new(params[:category])
    if request.post? and @category.save
      flash[:notice] = t('flash1')
      redirect_to :controller => "employee", :action => "add_category"
    end
  end
  
  def edit_category
    @category = EmployeeCategory.find(params[:id])
    employees = Employee.where("employee_category_id = ?",params[:id])
    if request.post?
      if (params[:category][:status] == 'false' and employees.blank?) or params[:category][:status] == 'true'
        
        if @category.update_attributes(params[:category])
          unless @category.status
            position = EmployeePosition.where(:employee_category_id => @category.id)
            position.each do |p|
              p.update_attributes(:status=> '0')
            end
          end
          flash[:notice] = t('flash2')
          redirect_to :action => "add_category"
        end
      else
        flash[:warn_notice] = "<p>#{t('flash2')}</p>"
      end
      
    end
  end

  def delete_category
    employees = Employee.where("employee_category_id = ?", params[:id])
    if employees.empty?
      employees = ArchivedEmployee.where("employee_category_id = ?",params[:id])
    end
    category_position = EmployeePosition.where("employee_category_id = ?",params[:id])
    if employees.empty? and category_position.empty?
      EmployeeCategory.find(params[:id]).destroy
      @categories = EmployeeCategory.all
      flash[:notice]=t('flash3')
      redirect_to :action => "add_category"
    else
      flash[:warn_notice]=t('flash4')
      redirect_to :action => "add_category"
    end
  end

  def add_position
    @positions = EmployeePosition.where('status = 1').order("name asc")
    @inactive_positions = EmployeePosition.where('status = 0').order("name asc")
    @categories = EmployeeCategory.where('status = 1').order("name asc")
    @position = EmployeePosition.new(params[:position])
    if request.post? and @position.save
      flash[:notice] = t('flash5')
      redirect_to :controller => "employee", :action => "add_position"
    end
  end

  def edit_position
    @categories = EmployeeCategory.all
    @position = EmployeePosition.find(params[:id])
    employees = Employee.where("employee_position_id = ?",params[:id])
    if request.post?
      if (params[:position][:status] == 'false' and employees.blank?) or params[:position][:status] == 'true'
        if @position.update_attributes(params[:position])
          flash[:notice] = t('flash6')
          redirect_to :action => "add_position"
        end
      end
      flash[:warn_notice] = "<p>#{t('flash38')}</p>"
    end

  end

  def delete_position
    employees = Employee.where("employee_position_id = ?",params[:id])
    if employees.empty?
      employees = ArchivedEmployee.where("employee_position_id = ?",params[:id])
    end
    if employees.empty?
      EmployeePosition.find(params[:id]).destroy
      @positions = EmployeePosition.all
      flash[:notice]=t('flash3')
      redirect_to :action => "add_position"
    else
      flash[:warn_notice]=t('flash4')
      redirect_to :action => "add_position"
    end
  end

  def add_department
    @departments = EmployeeDepartment.where('status = 1').order("name asc")
    @inactive_departments = EmployeeDepartment.where('status = 0').order("name asc")
    @department = EmployeeDepartment.new(params[:department])
    if request.post? and @department.save
      flash[:notice] =  t('flash7')
      redirect_to :controller => "employee", :action => "add_department"
    end
  end

  def edit_department
    @department = EmployeeDepartment.find(params[:id])
    employees = Employee.where("employee_department_id = ?",params[:id])
    if request.post?
      if (params[:department][:status] == 'false' and employees.blank?) or params[:department][:status] == 'true'
        if @department.update_attributes(params[:department])
          flash[:notice] = t('flash8')
          redirect_to :action => "add_department"
        end
      end
      flash[:warn_notice] = "<p>#{t('flash39')}</p>"
    end
  end

  def delete_department
    employees = Employee.where("employee_department_id = ?",params[:id])
    if employees.empty?
      employees = ArchivedEmployee.where("employee_department_id = ?",params[:id])
    end
    if employees.empty?
      EmployeeDepartment.find(params[:id]).destroy
      @departments = EmployeeDepartment.all
      flash[:notice]=t('flash3')
      redirect_to :action => "add_department"
    else
      flash[:warn_notice]=t('flash4')
      redirect_to :action => "add_department"
    end
  end

  def add_grade
    @grades = EmployeeGrade.where('status = 1').order("name asc")
    @inactive_grades = EmployeeGrade.where('status = 0').order("name asc")
    @grade = EmployeeGrade.new(params[:grade])
    if request.post? and @grade.save
      flash[:notice] =  t('flash9')
      redirect_to :controller => "employee", :action => "add_grade"
    end
  end

  def edit_grade
    @grade = EmployeeGrade.find(params[:id])
    employees = Employee.where("employee_grade_id = ? ",params[:id])
    if request.post?
      if (params[:grade][:status] == 'false' and employees.blank?) or params[:grade][:status] == 'true'
        if @grade.update_attributes(params[:grade])
          flash[:notice] = t('flash10')
          redirect_to :action => "add_grade"
        end
      end
      flash[:warn_notice] = "<p>#{t('flash40')}</p>"
    end
  end

  def delete_grade
    employees = Employee.where("employee_grade_id = ?",params[:id])
    if employees.empty?
      employees = ArchivedEmployee.where("employee_grade_id = ?",params[:id])
    end
    if employees.empty?
      EmployeeGrade.find(params[:id]).destroy
      @grades = EmployeeGrade.all
      flash[:notice]=t('flash3')
      redirect_to :action => "add_grade"
    else
      flash[:warn_notice]=t('flash4')
      redirect_to :action => "add_grade"
    end
  end

  def add_bank_details
    @bank_details = BankField.where(:status => true).order("name asc")
    @inactive_bank_details = BankField.where(:status => false).order("name asc")
    @bank_field = BankField.new(params[:bank_field])
    if request.post? and @bank_field.save
      flash[:notice] =t('flash11')
      redirect_to :controller => "employee", :action => "add_bank_details"
    end
  end

  def edit_bank_details
    @bank_details = BankField.find(params[:id])
    if request.post? and @bank_details.update_attributes(params[:bank_details])
      flash[:notice] = t('flash12')
      redirect_to :action => "add_bank_details"
    end
  end
  def delete_bank_details
    employees = EmployeeBankDetail.where("bank_field_id = ?",params[:id])
    if employees.empty?
      BankField.find(params[:id]).destroy
      @bank_details = BankField.all
      flash[:notice]=t('flash3')
      redirect_to :action => "add_bank_details"
    else
      flash[:warn_notice]=t('flash4')
      redirect_to :action => "add_bank_details"
    end
  end

  def add_additional_details
    @additional_details = AdditionalField.where(:status=>true).order("priority ASC")
    @inactive_additional_details = AdditionalField.where(:status=>false).order("priority ASC")
    @additional_field = AdditionalField.new
    @additional_field_option = @additional_field.additional_field_options.build
    if request.post?
      priority = 1
      unless @additional_details.empty?
        last_priority = @additional_details.map{|r| r.priority}.compact.sort.last
        priority = last_priority + 1
      end
      @additional_field = AdditionalField.new(params[:additional_field])
      @additional_field.priority = priority
      if @additional_field.save
        flash[:notice] = t('flash13')
        redirect_to :controller => "employee", :action => "add_additional_details"
      end
    end
  end
  
  def change_field_priority
    @additional_field = AdditionalField.find(params[:id])
    priority = @additional_field.priority
    @additional_fields = AdditionalField.where(:status => true).order("priority ASC").map{|b| b.priority.to_i}
    position = @additional_fields.index(priority)
    if params[:order]=="up"
      prev_field = AdditionalField.find_by_priority(@additional_fields[position - 1])
    else
      prev_field = AdditionalField.find_by_priority(@additional_fields[position + 1])
    end
    @additional_field.update_attributes(:priority=>prev_field.priority)
    prev_field.update_attributes(:priority=>priority.to_i)
    @additional_field = AdditionalField.new
    @additional_details = AdditionalField.where(:status=>true).order("priority ASC")
    @inactive_additional_details = AdditionalField.where(:status=>false).order("priority ASC")
    render(:update) do|page|
      page.replace_html "category-list", :partial=>"additional_fields"
    end
  end

  def edit_additional_details
    @additional_details = AdditionalField.where(:status=>true).order("priority ASC")
    @inactive_additional_details = AdditionalField.where(:status=>false).order("priority ASC")
    @additional_field = AdditionalField.find(params[:id])
    @additional_field_option = @additional_field.additional_field_options
    if request.get?
      render :action=>'add_additional_details'
    else
      if @additional_field.update_attributes(params[:additional_field])
        flash[:notice] = t('flash14')
        redirect_to :action => "add_additional_details"
      else
        render :action=>"add_additional_details"
      end
    end
  end

  def delete_additional_details
    if params[:id]
      employees = EmployeeAdditionalDetail.where("additional_field_id = ?",params[:id])
      if employees.empty?
        AdditionalField.find(params[:id]).destroy
        @additional_details = AdditionalField.all
        flash[:notice]=t('flash3')
        redirect_to :action => "add_additional_details"
      else
        flash[:warn_notice]=t('flash4')
        redirect_to :action => "add_additional_details"
      end
    else
      redirect_to :action => "add_additional_details"
    end
  end

  def admission1
    @user = current_user
    @user_name = @user.username
    @employee1 = @user.employee_record
    @categories = EmployeeCategory.where(:status => true).order("name asc")
    @positions = []
    @grades = EmployeeGrade.where(:status => true).order("name asc")
    @departments = EmployeeDepartment.where(:status => true).order("name asc")
    @nationalities = Country.all
    @employee = Employee.new(params[:employee])
    @selected_value = Config.default_country
    @last_admitted_employee = Employee.where("employee_number != 'admin'").last
    @config = Config.find_by_config_key('EmployeeNumberAutoIncrement')

    if request.post?

      unless params[:employee][:employee_number].to_i ==0
        @employee.employee_number= "E" + params[:employee][:employee_number].to_s
      end
      unless @employee.employee_number.to_s.downcase == 'admin'
        if @employee.save
          @leave_type = EmployeeLeaveType.all
          @leave_type.each do |e|
            EmployeeLeave.create( :employee_id => @employee.id, :employee_leave_type_id => e.id, :leave_count => e.max_leave_count)
          end
          flash[:notice] = "#{t('flash15')} #{@employee.first_name} #{t('flash16')}"
          redirect_to :controller =>"employee" ,:action => "admission2", :id => @employee.id
        end
      else
        @employee.errors.add(:employee_number, "#{t('should_not_be_admin')}")
      end
      @positions = EmployeePosition.where("employee_category_id = ? ",params[:employee][:employee_category_id])
    end
  end

  def update_positions
    category = EmployeeCategory.find(params[:category_id])
    @positions = EmployeePosition.where("employee_category_id = ? AND status = 1",category.id)
    render :update do |page|
      page.replace_html 'positions1', :partial => 'positions', :object => @positions
    end
  end

  def edit1
    @categories = EmployeeCategory.where("status = true").order("name asc")
    @positions = EmployeePosition.all
    @grades = EmployeeGrade.where(:status => true).order("name asc")
    @departments = EmployeeDepartment.where(:status => true).order("name asc")
    @employee = Employee.find(params[:id])
    @employee_user = @employee.user
    if request.post?
      if  params[:employee][:employee_number].downcase != 'admin' or @employee_user.admin
        if @employee.update_attributes(params[:employee])
          if params[:employee][:status] == "true"
            Employee.update(@employee.id, :status => true)
          else
            Employee.update(@employee.id, :status => false)
          end

          flash[:notice] = "#{t('flash15')}  #{@employee.first_name} #{t('flash17')}"
          redirect_to :controller =>"employee" ,:action => "profile", :id => @employee.id
        end
      else
        @employee.errors.add(:employee_number, "#{t('should_not_be_admin')}")
      end
    end
  end

  def edit_personal
    @nationalities = Country.all
    @employee = Employee.find(params[:id])
    if request.post?
      size = 0
      size =  params[:employee][:image_file].size.to_f unless  params[:employee][:image_file].nil?
      if size < 280000
        if @employee.update_attributes(params[:employee])
          flash[:notice] = "#{t('flash15')}  #{@employee.first_name} #{t('flash18')}"
          redirect_to :controller =>"employee" ,:action => "profile", :id => @employee.id
        end
      else
        flash[:notice] = t('flash19')
        redirect_to :controller => "employee", :action => "edit_personal", :id => @employee.id
      end
    end
  end

  def admission2
    @countries = Country.all
    @employee = Employee.find(params[:id])
    @selected_value = Config.default_country
    if request.post? and @employee.update_attributes(params[:employee])
      sms_setting = SmsSetting.new()
      if sms_setting.application_sms_active and sms_setting.employee_sms_active
        recipient = ["#{@employee.mobile_phone}"]
        message = "#{t('joining_info')} #{@employee.first_name}. #{t('username')}: #{@employee.employee_number}, #{t('password')}: #{@employee.employee_number}123. #{t('change_password_after_login')}"
        Delayed::Job.enqueue(SmsManager.new(message,recipient))
      end
      flash[:notice] = "#{t('flash20')} #{ @employee.first_name}"
      redirect_to :action => "admission3", :id => @employee.id
    end
  end
  
  def edit2
    @employee = Employee.find(params[:id])
    @countries = Country.all
    if request.post? and @employee.update_attributes(params[:employee])
      flash[:notice] = "#{t('flash21')} #{ @employee.first_name}"
      redirect_to :action => "profile", :id => @employee.id
    end
  end

  def edit_contact
    @employee = Employee.find(params[:id])
    if request.post? and @employee.update_attributes(params[:employee])
      User.update(@employee.user.id, :email=> @employee.email, :role=>@employee.user.role_name)
      flash[:notice] = "#{t('flash22')} #{ @employee.first_name}"
      redirect_to :action => "profile", :id => @employee.id
    end
  end


  def admission3
    @employee = Employee.find(params[:id])
    @bank_fields = BankField.where(:status => true)
    if @bank_fields.empty?
      redirect_to :action => "admission3_1", :id => @employee.id
    end
    if request.post?
      params[:employee_bank_details].each_pair do |k, v|
        EmployeeBankDetail.create(:employee_id => params[:id],
          :bank_field_id => k,:bank_info => v['bank_info'])
      end
      flash[:notice] = "#{t('flash23')} #{@employee.first_name}"
      redirect_to :action => "admission3_1", :id => @employee.id
    end
  end
  
  def edit3
    @employee = Employee.find(params[:id])
    @bank_fields = BankField.where(:status => true)
    if @bank_fields.empty?
      flash[:notice] = "#{t('flash36')}"
      redirect_to :action => "profile", :id => @employee.id
    end
    if request.post?
      params[:employee_bank_details].each_pair do |k, v|
        row_id= EmployeeBankDetail.find_by_employee_id_and_bank_field_id(@employee.id,k)
        unless row_id.nil?
          bank_detail = EmployeeBankDetail.find_by_employee_id_and_bank_field_id(@employee.id,k)
          EmployeeBankDetail.update(bank_detail.id,:bank_info => v['bank_info'])
        else
          EmployeeBankDetail.create(:employee_id=>@employee.id,:bank_field_id=>k,:bank_info=>v['bank_info'])
        end
      end
      flash[:notice] = "#{t('flash15')}#{@employee.first_name} #{t('flash12')}"
      redirect_to :action => "profile", :id => @employee.id
    end
  end

  #  def admission3_1
  #    @employee = Employee.find(params[:id])
  #    @additional_fields = AdditionalField.find(:all, :conditions=>"status = true")
  #    if @additional_fields.empty?
  #      redirect_to :action => "edit_privilege", :id => @employee.employee_number
  #    end
  #    if request.post?
  #      params[:employee_additional_details].each_pair do |k, v|
  #        EmployeeAdditionalDetail.create(:employee_id => params[:id],
  #          :additional_field_id => k,:additional_info => v['additional_info'])
  #      end
  #      flash[:notice] = "#{t('flash25')}#{@employee.first_name}"
  #      redirect_to :action => "edit_privilege", :id => @employee.employee_number
  #    end
  #  end

  def admission3_1
    @employee = Employee.find(params[:id])
    @employee_additional_details = EmployeeAdditionalDetail.where(:employee_id =>@employee.id)
    @additional_fields = AdditionalField.where(:status => true).order("priority ASC")
    if @additional_fields.empty?
      redirect_to :action => "edit_privilege", :id => @employee.employee_number
    end
    if request.post?
      @error=false
      mandatory_fields = AdditionalField.where(:is_mandatory=>true, :status=>true)
      mandatory_fields.each do|m|
        unless params[:employee_additional_details][m.id.to_s.to_sym].present?
          @employee.errors.add_to_base("#{m.name} must contain atleast one selected option.")
          @error=true
        else
          if params[:employee_additional_details][m.id.to_s.to_sym][:additional_info]==""
            @employee.errors.add_to_base("#{m.name} cannot be blank.")
            @error=true
          end
        end
      end
      unless @error==true
        params[:employee_additional_details].each_pair do |k, v|
          addl_info = v['additional_info']
          addl_field = AdditionalField.find_by_id(k)
          if addl_field.input_type == "has_many"
            addl_info = addl_info.join(", ")
          end
          prev_record = EmployeeAdditionalDetail.find_by_employee_id_and_additional_field_id(params[:id], k)
          unless prev_record.nil?
            prev_record.update_attributes(:additional_info => addl_info)
          else
            addl_detail = EmployeeAdditionalDetail.new(:employee_id => params[:id],
              :additional_field_id => k,:additional_info => addl_info)
            addl_detail.save if addl_detail.valid?
          end
        end
        unless params[:edit_request].present?
          flash[:notice] = "#{t('flash25')}#{@employee.first_name}"
          redirect_to :action => "edit_privilege", :id => @employee.employee_number
        else
          flash[:notice] = "#{t('flash15')}#{@employee.first_name} #{t('flash14')}"
          redirect_to :action => "profile", :id => @employee.id
        end
      end
    end
  end

  def edit_privilege
    @user = User.active.find_by_username(params[:id])
    @employee = @user.employee_record
    @finance = Config.find_by_config_value("Finance")
    @sms_setting = SmsSetting.application_sms_status
    @hr = Config.find_by_config_value("HR")
    @privilege_tags=PrivilegeTag.find(:all,:order=>"priority ASC")
    @user_privileges=@user.privileges
    if request.post?
      new_privileges = params[:user][:privilege_ids] if params[:user]
      new_privileges ||= []
      @user.privileges = Privilege.find_all_by_id(new_privileges)
      redirect_to :action => 'admission4',:id => @employee.id
    end
  end
  
  def edit3_1
    @employee = Employee.find(params[:id])
    @additional_fields = AdditionalField.where(:status => true)
    if @additional_fields.empty?
      flash[:notice] = "#{t('flash37')}"
      redirect_to :action => "profile", :id => @employee.id
    end
    if request.post?
      params[:employee_additional_details].each_pair do |k, v|
        row_id= EmployeeAdditionalDetail.find_by_employee_id_and_additional_field_id(@employee.id,k)
        unless row_id.nil?
          additional_detail = EmployeeAdditionalDetail.find_by_employee_id_and_additional_field_id(@employee.id,k)
          EmployeeAdditionalDetail.update(additional_detail.id,:additional_info => v['additional_info'])
        else
          EmployeeAdditionalDetail.create(:employee_id=>@employee.id,:additional_field_id=>k,:additional_info=>v['additional_info'])
        end
      end
      flash[:notice] = "#{t('flash15')}#{@employee.first_name} #{t('flash14')}"
      redirect_to :action => "profile", :id => @employee.id
    end
  end

  def admission4
    @departments = EmployeeDepartment.all
    @categories  = EmployeeCategory.all
    @positions   = EmployeePosition.all
    @grades      = EmployeeGrade.all
    if request.post?
      @employee = Employee.find(params[:id])
      Employee.update(@employee, :reporting_manager_id => params[:employee][:reporting_manager_id])
      flash[:notice]=t('flash25')
      redirect_to :controller => "payroll", :action => "manage_payroll", :id=>@employee.id
    end
  
  end

  def view_rep_manager
    @employee= Employee.find(params[:id])
    @reporting_manager = Employee.find(@employee.reporting_manager_id).first_name unless @employee.reporting_manager_id.nil?
    render :partial => "view_rep_manager"
  end

  def change_reporting_manager
    @departments = EmployeeDepartment.all
    @categories  = EmployeeCategory.all
    @positions   = EmployeePosition.all
    @grades      = EmployeeGrade.all
    @emp = Employee.find(params[:id])
    @reporting_manager = Employee.find(@emp.reporting_manager_id).first_name unless @emp.reporting_manager_id.nil?
    if request.post?
      @employee = Employee.find(params[:id])
      Employee.update(@employee, :reporting_manager_id => params[:employee][:reporting_manager_id])
      flash[:notice]=t('flash26')
      redirect_to :action => "profile", :id=>@employee.id
    end
  end

  def update_reporting_manager_name
    employee = Employee.find(params[:employee_reporting_manager_id])
    render :text => employee.first_name + ' ' + employee.last_name
  end

  def search
    @departments = EmployeeDepartment.all
    @categories  = EmployeeCategory.all
    @positions   = EmployeePosition.all
    @grades      = EmployeeGrade.all
  end

  def search_ajax
    other_conditions = ""
    other_conditions += " AND employee_department_id = '#{params[:employee_department_id]}'" unless params[:employee_department_id] == ""
    other_conditions += " AND employee_category_id = '#{params[:employee_category_id]}'" unless params[:employee_category_id] == ""
    other_conditions += " AND employee_position_id = '#{params[:employee_position_id]}'" unless params[:employee_position_id] == ""
    other_conditions += " AND employee_grade_id = '#{params[:employee_grade_id]}'" unless params[:employee_grade_id] == ""
    if params[:query].length>= 3
      @employee = Employee.where(["(first_name LIKE ? OR middle_name LIKE ? OR last_name LIKE ?
                       OR employee_number = ? OR (concat(first_name, \" \", last_name) LIKE ? ))"+ other_conditions,
          "#{params[:query]}%","#{params[:query]}%","#{params[:query]}%",
          "#{params[:query]}", "#{params[:query]}" ]).order("employee_department_id asc,first_name asc").includes("employee_department") unless params[:query] == ''
    else
      @employee = Employee.where(["(employee_number = ? )"+ other_conditions, "#{params[:query]}"]).order("employee_department_id asc,first_name asc").includes("employee_department") unless params[:query] == ''
    end
    render :layout => false
  end

  def select_reporting_manager
    other_conditions = ""
    other_conditions += " AND employee_department_id = '#{params[:employee_department_id]}'" unless params[:employee_department_id] == ""
    other_conditions += " AND employee_category_id = '#{params[:employee_category_id]}'" unless params[:employee_category_id] == ""
    other_conditions += " AND employee_position_id = '#{params[:employee_position_id]}'" unless params[:employee_position_id] == ""
    other_conditions += " AND employee_grade_id = '#{params[:employee_grade_id]}'" unless params[:employee_grade_id] == ""
    if params[:query].length>= 3
      @employee = Employee.where(["(first_name LIKE ? OR middle_name LIKE ? OR last_name LIKE ?
                       OR employee_number = ? OR (concat(first_name, \" \", last_name) LIKE ? ))"+ other_conditions,
          "#{params[:query]}%","#{params[:query]}%","#{params[:query]}%",
          "#{params[:query]}", "#{params[:query]}" ]).order("employee_department_id asc,first_name asc") unless params[:query] == ''
    else
      @employee = Employee.where(["employee_number = ? "+ other_conditions, "#{params[:query]}%"]).order("employee_department_id asc,first_name asc") unless params[:query] == ''
    end
    render :layout => false
  end

  def profile

    @current_user = current_user
    @employee = Employee.find(params[:id])
    @new_reminder_count = Reminder.where("recipient = ? AND is_read = false",@current_user.id)
    @gender = "Male"
    @gender = "Female" if @employee.gender == "f"
    @status = "Active"
    @status = "Inactive" if @employee.status == false
    @reporting_manager = Employee.find(@employee.reporting_manager_id).full_name unless @employee.reporting_manager_id.nil?
    exp_years = @employee.experience_year
    exp_months = @employee.experience_month
    date = Date.today
    total_current_exp_days = (date-@employee.joining_date).to_i
    current_years = (total_current_exp_days/365)
    rem = total_current_exp_days%365
    current_months = rem/30
    #year = exp_years+current_years unless exp_years.nil?
    #month = exp_months+current_months unless exp_months.nil?
    total_month = (exp_months || 0)+current_months
    year = total_month/12
    month = total_month%12
    @total_years = (exp_years || 0)+current_years+year
    @total_months = month

  end

  def profile_general
    @employee = Employee.find(params[:id])
    @gender = "Male"
    @gender = "Female" if @employee.gender == false
    @status = "Active"
    @status = "Inactive" if @employee.status == false
    @reporting_manager = Employee.find(@employee.reporting_manager_id).first_name unless @employee.reporting_manager_id.nil?
    exp_years = @employee.experience_year
    exp_months = @employee.experience_month
    date = Date.today
    total_current_exp_days = (date-@employee.joining_date).to_i
    current_years = (total_current_exp_days/365)
    rem = total_current_exp_days%365
    current_months = rem/30
    #year = exp_years+current_years unless exp_years.nil?
    #month = exp_months+current_months unless exp_months.nil?
    total_month = (exp_months || 0)+current_months
    year = total_month/12
    month = total_month%12
    @total_years = (exp_years || 0 )+current_years+year
    @total_months = month
    render :partial => "general"
  end

  def profile_personal
    @employee = Employee.find(params[:id])
    render :partial => "personal"
  end

  def profile_address
    @employee = Employee.find(params[:id])
    @home_country = Country.find(@employee.home_country_id).name unless @employee.home_country_id.nil?
    @office_country = Country.find(@employee.office_country_id).name unless @employee.office_country_id.nil?
    render :partial => "address"
  end

  def profile_contact
    @employee = Employee.find(params[:id])
    render :partial => "contact"
  end

  def profile_bank_details
    @employee = Employee.find(params[:id])
    @bank_details = EmployeeBankDetail.where(:employee_id => @employee.id)
    render :partial => "bank_details"
  end

  def profile_additional_details
    @employee = Employee.find(params[:id])
    @additional_details = EmployeeAdditionalDetail.where(:employee_id => @employee.id)
    render :partial => "additional_details"
  end


  def profile_payroll_details
    @currency_type = Config.find_by_config_key("CurrencyType").config_value
    @employee = Employee.find(params[:id])
    @payroll_details = EmployeeSalaryStructure.where(:employee_id => @employee).order("payroll_category_id ASC")
    render :partial => "payroll_details"
  end

  def profile_pdf
    @employee = Employee.find(params[:id])
    @gender = "Male"
    @gender = "Female" if @employee.gender == "f"
    @status = "Active"
    @status = "Inactive" if @employee.status == false
    @reporting_manager = Employee.find(@employee.reporting_manager_id).first_name unless @employee.reporting_manager_id.nil?
    exp_years = @employee.experience_year
    exp_months = @employee.experience_month
    date = Date.today
    total_current_exp_days = (date-@employee.joining_date).to_i
    current_years = total_current_exp_days/365
    rem = total_current_exp_days%365
    current_months = rem/30
    total_month = current_months if exp_months.nil?
    total_month = exp_months+current_months unless exp_months.nil?
    year = total_month/12
    month = total_month%12
    @total_years = current_years+year if exp_years.nil?
    @total_years = exp_years+current_years+year unless exp_years.nil?
    @total_months = month
    @home_country = Country.find(@employee.home_country_id).name unless @employee.home_country_id.nil?
    @office_country = Country.find(@employee.office_country_id).name unless @employee.office_country_id.nil?
    @bank_details = EmployeeBankDetail.where(:employee_id => @employee.id)
    @additional_details = EmployeeAdditionalDetail.where(:employee_id => @employee.id)
    render :pdf => 'profile_pdf'
          
            
    #    respond_to do |format|
    #      format.pdf { render :layout => false }
    #    end
  end

  def view_all
    @departments = EmployeeDepartment.active
  end

  def employees_list
    department_id = params[:department_id]
    @employees = Employee.where(:employee_department_id => department_id).order('first_name ASC')

    render :update do |page|
      page.replace_html 'employee_list', :partial => 'employee_view_all_list', :object => @employees
    end
  end

  def show
    @employee = Employee.find(params[:id])
    send_data(@employee.photo_data, :type => @employee.photo_content_type, :filename => @employee.photo_filename, :disposition => 'inline')
  end

  def add_payslip_category
    @employee = Employee.find(params[:emp_id])
    @salary_date = (params[:salary_date])
    render :partial => "payslip_category_form"
  end

  def create_payslip_category
    @employee=Employee.find(params[:employee_id])
    @salary_date= (params[:salary_date])
    @created_category = IndividualPayslipCategory.new(:employee_id=>params[:employee_id],:name=>params[:name],:amount=>params[:amount])
    if @created_category.save
      if params[:is_deduction] == nil
        IndividualPayslipCategory.update(@created_category.id, :is_deduction=>false)
      else
        IndividualPayslipCategory.update(@created_category.id, :is_deduction=>params[:is_deduction])
      end

      if params[:include_every_month] == nil
        IndividualPayslipCategory.update(@created_category.id, :include_every_month=>false)
      else
        IndividualPayslipCategory.update(@created_category.id, :include_every_month=>params[:include_every_month])
      end

      @new_payslip_category = IndividualPayslipCategory.where("employee_id = ? AND salary_date = ? ",@employee.id,nil)
      @individual = IndividualPayslipCategory.where("employee_id = ? AND salary_date = ? ",@employee.id,@salary_date).first
      render :partial => "payslip_category_list",:locals => {:emp_id => @employee.id, :salary_date=>@salary_date}
    else
      render :partial => "payslip_category_form"
    end
  end

  def remove_new_paylist_category
    removal_category = IndividualPayslipCategory.find(params[:id])
    employee = removal_category.employee_id
    @salary_date = params[:id3]
    removal_category.destroy
    @new_payslip_category = IndividualPayslipCategory.where("employee_id = ? AND salary_date = ?",@employee,nil)
    @individual = IndividualPayslipCategory.where("employee_id = ?  AND salary_date = ?",@employee,@salary_date) unless params[:id3]==''
    @individual ||= []
    render :partial => "list_payslip_category"
  end

  def create_monthly_payslip
    @new_payslip_category == []
    @salary_date = ''
    @employee = Employee.find(params[:id])
    @independent_categories = PayrollCategory.where("payroll_category_id = ? AND status = ?",nil, true)
    @dependent_categories = PayrollCategory.where("status ? AND payroll_category_id != \'\'",true)
    @employee_additional_categories = IndividualPayslipCategory.where("employee_id = ? AND include_every_month = true",@employee.id)
    @new_payslip_category = IndividualPayslipCategory.where("employee_id = ? AND salary_date = ?",@employee.id,nil)
    @individual = IndividualPayslipCategory.where("employee_id = ? AND salary_date =?",@employee.id,Date.today)
    @user = current_user
    if request.post?
      salary_date = Date.parse(params[:salary_date])
      unless salary_date.to_date < @employee.joining_date.to_date
        start_date = salary_date - ((salary_date.day - 1).days)
        end_date = start_date + 1.month
        payslip_exists = MonthlyPayslip.where("employee_id = ? AND salary_date >= ? and salary_date < ?",@employee.id, start_date, end_date)
        if payslip_exists == []
          params[:manage_payroll].each_pair do |k, v|
            row_id = EmployeeSalaryStructure.find_by_employee_id_and_payroll_category_id(@employee, k)
            category_name = PayrollCategory.find(k).name
            unless row_id.nil?
              MonthlyPayslip.create(:salary_date=>start_date,:employee_id => params[:id],
                :payroll_category_id => k,:amount => v['amount'])
            else
              MonthlyPayslip.create(:salary_date=>start_date,:employee_id => params[:id],
                :payroll_category_id => k,:amount => v['amount'])
            end
          end
          individual_payslip_category = IndividualPayslipCategory.where("employee_id = ? AND salary_date = ?",@employee.id,nil)
          individual_payslip_category.each do |c|
            IndividualPayslipCategory.update(c.id, :salary_date=>start_date)
          end
          flash[:notice] = "#{@employee.first_name} #{t('flash27')} #{params[:salary_date]}"
        else #else for if payslip_exists == []
          individual_payslips_generated = IndividualPayslipCategory.where("employee_id = ? AND salary_date = ?",@employee.id,nil)
          unless individual_payslips_generated.nil?
            individual_payslips_generated.each do|i|
              i.delete
            end
          end
          flash[:notice] = "#{@employee.first_name} #{t('flash28')} #{params[:salary_date]}"
        end
        privilege = Privilege.find_by_name("FinanceControl")
        finance_manager_ids = privilege.user_ids
        subject = t('payslip_generated')
        body = "#{t('payslip_generated_for')}  "+@employee.first_name+" "+@employee.last_name+". #{t('kindly_approve')}"
        Delayed::Job.enqueue(DelayedReminderJob.new( :sender_id  => @user.id,
            :recipient_ids => finance_manager_ids,
            :subject=>subject,
            :body=>body ))
        redirect_to :controller => "employee", :action => "select_department_employee"
      else
        flash[:warn_notice] = "#{t('flash45')} #{params[:salary_date]}"
      end
    end
    
  end

  def view_payslip
    @employee = Employee.find(params[:id])
    @salary_dates = MonthlyPayslip.select("salary_date").where("employee_id = ? AND is_approved = true",params[:id]).distinct
    render :partial => "select_dates"
  end

  def update_monthly_payslip
    @currency_type = Config.find_by_config_key("CurrencyType").config_value
    @salary_date = params[:salary_date]
    if params[:salary_date] == ""
      render :update do |page|
        page.replace_html "payslip_view", :text => ""
      end
      return
    end
    @monthly_payslips = MonthlyPayslip.where("salary_date = ? AND employee_id = ?",params[:salary_date],params[:emp_id]).order("payroll_category_id ASC")
    @individual_payslip_category = IndividualPayslipCategory.where("salary_date = ? AND employee_id = ? ",params[:salary_date],params[:emp_id]).order("id ASC")
    @individual_category_non_deductionable = 0
    @individual_category_deductionable = 0
    @individual_payslip_category.each do |pc|
      unless pc.is_deduction == true
        @individual_category_non_deductionable = @individual_category_non_deductionable + pc.amount.to_i
      end
    end

    @individual_payslip_category.each do |pc|
      unless pc.is_deduction == false
        @individual_category_deductionable = @individual_category_deductionable + pc.amount.to_i
      end
    end

    @non_deductionable_amount = 0
    @deductionable_amount = 0
    @monthly_payslips.each do |mp|
      category1 = PayrollCategory.find(mp.payroll_category_id)
      unless category1.is_deduction == true
        @non_deductionable_amount = @non_deductionable_amount + mp.amount.to_i
      end
    end

    @monthly_payslips.each do |mp|
      category2 = PayrollCategory.find(mp.payroll_category_id)
      unless category2.is_deduction == false
        @deductionable_amount = @deductionable_amount + mp.amount.to_i
      end
    end

    @net_non_deductionable_amount = @individual_category_non_deductionable + @non_deductionable_amount
    @net_deductionable_amount = @individual_category_deductionable + @deductionable_amount

    @net_amount = @net_non_deductionable_amount - @net_deductionable_amount
    render :update do |page|
      page.replace_html "payslip_view", :partial => "view_payslip"
    end
  end

  def delete_payslip
    @individual_payslip_category=IndividualPayslipCategory.where("employee_id = ? AND salary_date = ?",params[:id],params[:id2])
    @individual_payslip_category.each do |pc|
      pc.destroy
    end
    @monthly_payslip = MonthlyPayslip.where("employee_id = ? AND salary_date = ? ",params[:id], params[:id2])
    @monthly_payslip.each do |m|
      m.destroy
    end
    flash[:notice]= "#{t('flash30')} #{params[:id2]}"
    redirect_to :controller=>"employee", :action=>"profile", :id=>params[:id]
  end

  def view_attendance
    @employee = Employee.find(params[:id])
    @attendance_report = EmployeeAttendance.where(:employee_id => @employee.id)
    @leave_types = EmployeeLeaveType.where(:status => true)
    @leave_count = EmployeeLeave.joins(:employee_leave_type).where("employee_id = ? AND employee_leave_types.status = true", @employee)
    @total_leaves = 0
    @leave_types.each do |lt|
      leave_count = EmployeeAttendance.where("employee_id = ? AND employee_leave_type_id = ?",@employee.id,lt.id).size
      @total_leaves = @total_leaves + leave_count
    end
    render :partial => "attendance_report"
  end

  def employee_leave_count_edit
    @leave_count = EmployeeLeave.find_by_id(params[:id])
    @leave_type = EmployeeLeaveType.find_by_id(params[:leave_type])

    render :update do |page|
      page.replace_html 'profile-infos', :partial => 'edit_leave_count'
    end
  end

  def employee_leave_count_update
    available_leave = params[:leave_count][:leave_count]
    leave = EmployeeLeave.find_by_id(params[:id])
    leave.update_attributes(:leave_count => available_leave.to_f)
    @employee = Employee.find(leave.employee_id)
    @attendance_report = EmployeeAttendance.where(:employee_id => @employee.id)
    @leave_types = EmployeeLeaveType.where("status = true")
    @leave_count = EmployeeLeave.where(:employee_id => @employee)
    @total_leaves = 0
    @leave_types.each do |lt|
      leave_count = EmployeeAttendance.where("employee_id = ? AND employee_leave_type_id = ?",@employee.id,lt.id).size
      @total_leaves = @total_leaves + leave_count
    end
    render :update do |page|
      page.replace_html 'profile-infos',:partial => "attendance_report"
    end
  end

  def subject_assignment
    @batches = Batch.active
    @subjects = []
  end

  def update_subjects
    batch = Batch.find(params[:batch_id])
    @subjects = Subject.where("batch_id = ? AND is_deleted = false",batch.id)

    render :update do |page|
      page.replace_html 'subjects1', :partial => 'subjects', :object => @subjects
    end
  end

  def select_department
    @subject = Subject.find(params[:subject_id])
    @assigned_employee = EmployeesSubject.where(:subject_id => @subject.id)
    @departments = EmployeeDepartment.where(:status=>true)
    render :update do |page|
      page.replace_html 'department-select', :partial => 'select_department'
    end
  end

  def update_employees
    @subject = Subject.find(params[:subject_id])
    @employees = Employee.where("employee_department_id = ? AND status =?",params[:department_id],true)
    render :update do |page|
      page.replace_html 'employee-list', :partial => 'employee_list'
    end
  end

  def assign_employee
    @departments = EmployeeDepartment.where(:status=>true)
    @subject = Subject.find(params[:id1])
    @employees = Employee.where(:employee_department_id => Employee.find(params[:id]).employee_department_id)
    EmployeesSubject.create(:employee_id => params[:id], :subject_id => params[:id1])
    @assigned_employee = EmployeesSubject.where(:subject_id => @subject.id)
    render :partial =>"select_department"
  end

  def remove_employee
    @departments = EmployeeDepartment.where(:status=>true)
    @subject = Subject.find(params[:id1])
    @employees = Employee.where(:employee_department_id => Employee.find(params[:id]).employee_department_id)
    if TimetableEntry.where("subject_id = ? AND employee_id =?",@subject.id,params[:id]).blank?
      EmployeesSubject.find_by_employee_id_and_subject_id(params[:id], params[:id1]).destroy
    else
      flash.now[:warn_notice]="<p>#{t('employee.flash41')}</p> <p>#{t('employee.flash42')}</p> "
    end
    @assigned_employee = EmployeesSubject.where(:subject_id => @subject.id)
    render :partial =>"select_department"
  end

  def timetable
    @employee = Employee.find(params[:id])
    @weekday = ["#{t('sun')}", "#{t('mon')}", "#{t('tue')}", "#{t('wed')}", "#{t('thu')}", "#{t('fri')}", "#{t('sat')}"]
    @employee_subjects = @employee.subjects
    @employee_timetable_subjects = @employee_subjects.map {|sub| sub.elective_group_id.nil? ? sub : sub.elective_group.subjects}.flatten!
    @subject_timetable_entries = @employee_timetable_subjects.map{|esub| esub.timetable_entries}
    @employee_subjects_ids = @employee_subjects.map {|sub| sub.id}
    @weekday_timetable = Hash.new
    @subject_timetable_entries.each do  |subtt|
      subtt.each do |tte|
        if tte.employee_id == @employee.id
          @weekday_timetable[tte.weekday.weekday] ||=[]
          @weekday_timetable[tte.weekday.weekday] << tte
        end
      end
    end
  end

  def timetable_pdf
    @employee = Employee.find(params[:id])
    @weekday = ["#{t('sun')}", "#{t('mon')}", "#{t('tue')}", "#{t('wed')}", "#{t('thu')}", "#{t('fri')}", "#{t('sat')}"]
    @employee_subjects = @employee.subjects
    @employee_timetable_subjects = @employee_subjects.map {|sub| sub.elective_group_id.nil? ? sub : sub.elective_group.subjects}.flatten!
    @subject_timetable_entries = @employee_timetable_subjects.map{|esub| esub.timetable_entries}
    @employee_subjects_ids = @employee_subjects.map {|sub| sub.id}
    @weekday_timetable = Hash.new
    @subject_timetable_entries.each do  |subtt|
      subtt.each do |tte|
        if tte.employee_id == @employee.id
          @weekday_timetable[tte.weekday.weekday] ||=[]
          @weekday_timetable[tte.weekday.weekday] << tte
        end
      end
    end
    render :pdf=>'timetable_pdf'

  end
  #HR Management special methods...

  def hr
    user = current_user
    @employee = user.employee_record
  end

  def select_department_employee
    @departments = EmployeeDepartment.active
    @employees = []
  end

  def rejected_payslip
    @departments = EmployeeDepartment.active
    @employees = []
  end

  def update_rejected_employee_list
    department_id = params[:department_id]
    #@employees = Employee.find_all_by_employee_department_id(department_id)
    @employees = MonthlyPayslip.joins(:employee).where("monthly_payslips.is_rejected =true").group('employee_id,monthly_payslips.id') 
    @employees.reject!{|x| x.employee.employee_department_id != department_id.to_i}

    render :update do |page|
      page.replace_html 'employees_select_list', :partial => 'rejected_employee_select_list', :object => @employees
    end
  end

  def edit_rejected_payslip
    @salary_date = params[:id2]
    @employee = Employee.find(params[:id])
    @monthly_payslips = MonthlyPayslip.where("salary_date = ? AND employee_id = ?",@salary_date,params[:id]).order("payroll_category_id ASC")
    @individual = IndividualPayslipCategory.where("employee_id = ? AND salary_date = ?",@employee.id,@salary_date)
    @independent_categories = PayrollCategory.where("payroll_category_id =? AND status = ?",nil, true)
    @dependent_categories = PayrollCategory.where("status = ? and payroll_category_id != \'\'",true)
    @employee_additional_categories = IndividualPayslipCategory.where("employee_id = ? AND include_every_month = true",@employee.id)
    @new_payslip_category = IndividualPayslipCategory.where("employee_id = ? AND salary_date = ?",@employee.id,nil)
    @user = current_user
    

    if request.post?
      salary_date = Date.parse(params[:salary_date])
      start_date = salary_date - ((salary_date.day - 1).days)
      end_date = start_date + 1.month
      payslip_exists = MonthlyPayslip.where("employee_id = ? AND salary_date >= ? AND salary_date < ?", @employee.id, start_date, end_date)
      payslip_exists.each do |p|
        p.delete
      end
      
      params[:manage_payroll].each_pair do |k, v|
        row_id = EmployeeSalaryStructure.find_by_employee_id_and_payroll_category_id(@employee, k)
        category_name = PayrollCategory.find(k).name
        unless row_id.nil?
          MonthlyPayslip.create(:salary_date=>start_date,:employee_id => params[:id],
            :payroll_category_id => k,:amount => v['amount'])
        else
          MonthlyPayslip.create(:salary_date=>start_date,:employee_id => params[:id],
            :payroll_category_id => k,:amount => v['amount'])
        end
      end
      individual_payslip_category = IndividualPayslipCategory.where("employee_id = ? AND salary_date = ? ",@employee.id,nil)
      individual_payslip_category.each do |c|
        IndividualPayslipCategory.update(c.id, :salary_date=>start_date)
      end
      privilege = Privilege.find_by_name("FinanceControl")
      available_user_ids = privilege.user_ids
      subject = "#{t('rejected_payslip_regenerated')}"
      body = "#{t('payslip_has_been_generated_for')}"+@employee.first_name+" "+@employee.last_name + " (#{t('employee_number')} :#{@employee.employee_number})" + " #{t('for_the_month')} #{salary_date.to_date.strftime("%B %Y")}. #{t('kindly_approve')}"
      Delayed::Job.enqueue(DelayedReminderJob.new( :sender_id  => @user.id,
          :recipient_ids => available_user_ids,
          :subject=>subject,
          :body=>body ))
      flash[:notice] = "#{@employee.first_name} #{t('flash27')} #{params[:salary_date]}"
      redirect_to :controller => "employee", :action => "profile", :id=> @employee.id
      
    end
  end
  def update_rejected_payslip
    @salary_date = params[:salary_date]
    @employee = Employee.find(params[:emp_id])
    @currency_type = Config.find_by_config_key("CurrencyType").config_value

    if params[:salary_date] == ""
      render :update do |page|
        page.replace_html "payslip_view", :text => ""
      end
      return
    end
    @monthly_payslips = MonthlyPayslip.where("salary_date = ? AND employee_id = ?", @salary_date,params[:emp_id]).order("payroll_category_id ASC")

    @individual_payslip_category = IndividualPayslipCategory.where("salary_date = ? AND employee_id = ? ",@salary_date,params[:emp_id]).order("id ASC")
    @individual_category_non_deductionable = 0
    @individual_category_deductionable = 0
    @individual_payslip_category.each do |pc|
      unless pc.is_deduction == true
        @individual_category_non_deductionable = @individual_category_non_deductionable + pc.amount.to_i
      end
    end

    @individual_payslip_category.each do |pc|
      unless pc.is_deduction == false
        @individual_category_deductionable = @individual_category_deductionable + pc.amount.to_i
      end
    end

    @non_deductionable_amount = 0
    @deductionable_amount = 0
    @monthly_payslips.each do |mp|
      category1 = PayrollCategory.find(mp.payroll_category_id)
      unless category1.is_deduction == true
        @non_deductionable_amount = @non_deductionable_amount + mp.amount.to_i
      end
    end

    @monthly_payslips.each do |mp|
      category2 = PayrollCategory.find(mp.payroll_category_id)
      unless category2.is_deduction == false
        @deductionable_amount = @deductionable_amount + mp.amount.to_i
      end
    end

    @net_non_deductionable_amount = @individual_category_non_deductionable + @non_deductionable_amount
    @net_deductionable_amount = @individual_category_deductionable + @deductionable_amount

    @net_amount = @net_non_deductionable_amount - @net_deductionable_amount

    render :update do |page|
      page.replace_html 'rejected_payslip', :partial => 'rejected_payslip'
    end
  end
  def view_rejected_payslip

    @payslips = MonthlyPayslip.where("employee_id = ? AND is_rejected is true",params[:id]).group('salary_date','id')
    @emp = Employee.find(params[:id])
  end

  def update_employee_select_list
    department_id = params[:department_id]
    @employees = Employee.where("employee_department_id = ?",department_id)
    @employees = @employees.sort_by { |u1| [u1.full_name.to_s.downcase ] } if @employees.present?
    render :update do |page|
      page.replace_html 'employees_select_list', :partial => 'employee_select_list', :object => @employees
    end
  end

  def payslip_date_select
    render :partial=>"one_click_payslip_date"
  end

  def one_click_payslip_generation

    @user = current_user
    finance_manager = find_finance_managers
    finance = Config.find_by_config_value("Finance")
    subject = "#{t('payslip_generated')}"
    body = "#{t('message_body')}"
    salary_date = Date.parse(params[:salary_date])
    start_date = salary_date - ((salary_date.day - 1).days)
    end_date = start_date + 1.month
    employees = Employee.find(:all)
    unless(finance_manager.nil? and finance.nil?)
      finance_manager_ids = Privilege.find_by_name('FinanceControl').user_ids
      Delayed::Job.enqueue(DelayedReminderJob.new( :sender_id  => @user.id,
          :recipient_ids => finance_manager_ids,
          :subject=>subject,
          :body=>body ))
      employees.each do|e|
        payslip_exists = MonthlyPayslip.where("employee_id = ? AND salary_date >= ? AND salary_date < ?", e.id, start_date, end_date)
        if payslip_exists == []
          salary_structure = EmployeeSalaryStructure.where("employee_id =?",e.id)
          unless salary_structure == []
            salary_structure.each do |ss|
              MonthlyPayslip.create(:salary_date=>start_date,
                :employee_id=>e.id,
                :payroll_category_id=>ss.payroll_category_id,
                :amount=>ss.amount,:is_approved => false,:approver => nil)
            end
          end
        end
      end
    else
      employees.each do|e|
        payslip_exists = MonthlyPayslip.where("employee_id = ? AND salary_date >= ? AND salary_date < ?",e.id, start_date, end_date)
        if payslip_exists == []
          salary_structure = EmployeeSalaryStructure.where("employee_id = ?",e.id)
          unless salary_structure == []
            salary_structure.each do |ss|
              MonthlyPayslip.create(:salary_date=>start_date,
                :employee_id=>e.id,
                :payroll_category_id=>ss.payroll_category_id,
                :amount=>ss.amount,:is_approved => true,:approver => @user.id)
            end
          end
        end
      end
    end
    render :text => "<p>#{t('salary_slip_for_month')}: #{salary_date.strftime("%B")}.<br/><b>#{t('note')}:</b> #{t('employees_salary_generated_manually')}</p>"
  end

  def payslip_revert_date_select
    @salary_dates = MonthlyPayslip.select("distinct salary_date")
    render :partial=>"one_click_payslip_revert_date"
  end

  def one_click_payslip_revert
    unless params[:one_click_payslip][:salary_date] == ""
      salary_date = Date.parse(params[:one_click_payslip][:salary_date])
      start_date = salary_date - ((salary_date.day - 1).days)
      end_date = start_date + 1.month
      employees = Employee.find(:all)
      employees.each do|e|
        payslip_record = MonthlyPayslip.where("employee_id = ? AND salary_date >= ? AND salary_date < ?",e.id, start_date, end_date)
        payslip_record.each do |pr|
          pr.destroy unless pr.is_approved
        end
        payslip_record = MonthlyPayslip.where("employee_id = ? AND salary_date >= ? AND salary_date < ?",e.id, start_date, end_date)

        if payslip_record.empty?
          individual_payslip_record = IndividualPayslipCategory.where("employee_id = ? AND salary_date >= ? AND salary_date < ?", e.id,start_date, end_date)
          unless individual_payslip_record.nil?
            individual_payslip_record.each do|ipr|
              ipr.destroy
            end
          end
        end
      end
      render :text=> "<p>#{t('salary_slip_reverted')}: #{salary_date.strftime("%B")}.</p>"
    else
      render :text=>"<p>#{t('please_select_month')}</p>"
    end
  end

  def leave_management
    user = current_user
    @employee = user.employee_record
    @all_employee = Employee.all
    @reporting_employees = Employee.where("reporting_manager_id = ?",@employee.id)
    @leave_types = EmployeeLeaveType.all
    @total_leave_count = 0
    @reporting_employees.each do |e|
      @app_leaves = ApplyLeave.where("employee_id =? AND viewed_by_manager =?", e.id, false).count
      @total_leave_count = @total_leave_count + @app_leaves
    end
    @all_employee_total_leave_count = 0
    @all_employee.each do |a|
      @all_emp_app_leaves = ApplyLeave.where("employee_id = ? AND viewed_by_manager = ?" , a.id, false).count
      @all_employee_total_leave_count = @all_employee_total_leave_count + @all_emp_app_leaves
    end

    @leave_apply = ApplyLeave.new(params[:leave_apply])
    if request.post? and @leave_apply.save
      ApplyLeave.update(@leave_apply, :approved=> false, :viewed_by_manager=> false)
      if params[:is_half_day]
        ApplyLeave.update(@leave_apply, :is_half_day=> true)
      else
        ApplyLeave.update(@leave_apply, :is_half_day=> false)
      end
      flash[:notice]=t('flash31')
      redirect_to :controller => "employee", :action=> "leave_management", :id=>@employee.id
    end
  end

  def all_employee_leave_applications

    @employee = Employee.find(params[:id])
    @departments = EmployeeDepartment.order("name ASC")
    @employees = []
    render :partial=> "all_employee_leave_applications"
  end

  def update_employees_select
    @employee = params[:emp_id]
    department_id = params[:department_id]
    @employees = Employee.where("employee_department_id = ? ",department_id)

    render :update do |page|
      page.replace_html 'employees_select', :partial => 'employee_select', :object => @employees
    end
  end

  def leave_list
    if params[:employee_id] == ""
      render :update do |page|
        page.replace_html "leave-list", :text => "none"
      end
      return
    end
    @employee = params[:emp_id]
    @pending_applied_leaves = ApplyLeave.where("employee_id = ? AND approved = false AND viewed_by_manager = false",params[:employee_id]).order("start_date DESC")
    @applied_leaves = ApplyLeave.where("employee_id = ? AND viewed_by_manager = true",params[:employee_id]).order("start_date DESC")
    @all_leave_applications = ApplyLeave.where("employee_id = ?",params[:employee_id])
    render :update do |page|
      page.replace_html "leave-list", :partial => "leave_list"
    end
  end

  def department_payslip
    @departments = EmployeeDepartment.where("status = true").order("name ASC")
    @salary_dates = MonthlyPayslip.select("distinct salary_date")
    if request.post?
      post_data = params[:payslip]
      unless post_data.blank?
        if post_data[:salary_date].present? and post_data[:department_id].present?
          @payslips = MonthlyPayslip.find_and_filter_by_department(post_data[:salary_date],post_data[:department_id])
        else
          flash[:notice] = "#{t('select_salary_date')}"
          redirect_to :action=>"department_payslip"
        end
      end
    end
  end

  def view_employee_payslip
    @monthly_payslips = MonthlyPayslip.includes(:payroll_category).where("employee_id=? AND salary_date = ?",params[:id],params[:salary_date])
    @individual_payslips =  IndividualPayslipCategory.where("employee_id=? AND salary_date = ?",params[:id],params[:salary_date])
    @salary  = Employee.calculate_salary(@monthly_payslips, @individual_payslips)
  end

  #PDF methods

  def view_employee_payslip_pdf
    @employee = Employee.where(:id => params[:id]).first
    @employee ||= ArchivedEmployee.where(:former_id => params[:id]).first
    @monthly_payslips = MonthlyPayslip.includes(:payroll_category).where("employee_id=? AND salary_date = ?",params[:id],params[:salary_date])
    @individual_payslips =  IndividualPayslipCategory.where("employee_id=? AND salary_date = ?",params[:id],params[:salary_date])
    @salary  = Employee.calculate_salary(@monthly_payslips, @individual_payslips)
    @salary_date = params[:salary_date] if params[:salary_date]
  end

  def department_payslip_pdf
    @department = EmployeeDepartment.find(params[:department])
    @employees = Employee.where(:employee_department_id =>@department.id)


    @currency_type = Config.find_by_config_key("CurrencyType").config_value
    @salary_date = params[:salary_date] if params[:salary_date]
   
    render :pdf => 'department_payslip_pdf',
      :margin => {    :top=> 10,
      :bottom => 10,
      :left=> 30,
      :right => 30}
    #    respond_to do |format|
    #      format.pdf { render :layout => false }
    #    end

  end

  def individual_payslip_pdf
    @employee = Employee.find(params[:id])
    @department = EmployeeDepartment.find(@employee.employee_department_id).name
    @currency_type = Config.find_by_config_key("CurrencyType").config_value
    @category = EmployeeCategory.find(@employee.employee_category_id).name
    @grade = EmployeeGrade.find(@employee.employee_grade_id).name unless @employee.employee_grade_id.nil?
    @position = EmployeePosition.find(@employee.employee_position_id).name
    @salary_date = Date.parse(params[:id2])
    @monthly_payslips = MonthlyPayslip.where("salary_date = ? AND employee_id = ?",@salary_date,@employee.id).order("payroll_category_id ASC")

    @individual_payslip_category = IndividualPayslipCategory.where("salary_date = ? AND employee_id = ?",@salary_date,@employee.id).order("id ASC")
    @individual_category_non_deductionable = 0
    @individual_category_deductionable = 0
    @individual_payslip_category.each do |pc|
      unless pc.is_deduction == true
        @individual_category_non_deductionable = @individual_category_non_deductionable + pc.amount.to_i
      end
    end

    @individual_payslip_category.each do |pc|
      unless pc.is_deduction == false
        @individual_category_deductionable = @individual_category_deductionable + pc.amount.to_i
      end
    end

    @non_deductionable_amount = 0
    @deductionable_amount = 0
    @monthly_payslips.each do |mp|
      category1 = PayrollCategory.find(mp.payroll_category_id)
      unless category1.is_deduction == true
        @non_deductionable_amount = @non_deductionable_amount + mp.amount.to_i
      end
    end

    @monthly_payslips.each do |mp|
      category2 = PayrollCategory.find(mp.payroll_category_id)
      unless category2.is_deduction == false
        @deductionable_amount = @deductionable_amount + mp.amount.to_i
      end
    end

    @net_non_deductionable_amount = @individual_category_non_deductionable + @non_deductionable_amount
    @net_deductionable_amount = @individual_category_deductionable + @deductionable_amount

    @net_amount = @net_non_deductionable_amount - @net_deductionable_amount
    render :pdf => 'individual_payslip_pdf'
    

    #    respond_to do |format|
    #      format.pdf { render :layout => false }
    #    end
  end
  def employee_individual_payslip_pdf
    @employee = Employee.where("id= ?",params[:id]).first
    if @employee.blank?
      @employee = ArchivedEmployee.where("former_id= ?",params[:id]).first
      @employee.id = @employee.former_id
    end
    @bank_details = EmployeeBankDetail.where("employee_id = ?",@employee.id)
    @employee ||= ArchivedEmployee.where("former_id= ?",params[:id]).first
    @department = EmployeeDepartment.find(@employee.employee_department_id).name
    @currency_type = Config.find_by_config_key("CurrencyType").config_value
    @category = EmployeeCategory.find(@employee.employee_category_id).name
    @grade = EmployeeGrade.find(@employee.employee_grade_id).name unless @employee.employee_grade_id.nil?
    @position = EmployeePosition.find(@employee.employee_position_id).name
    @salary_date = Date.parse(params[:id2])
    @monthly_payslips = MonthlyPayslip.where("salary_date = ? AND employee_id = ?",@salary_date,params[:id]).order("payroll_category_id ASC")
    @individual_payslip_category = IndividualPayslipCategory.where("salary_date =? AND employee_id = ?",@salary_date,params[:id]).order("id ASC")
    @individual_category_non_deductionable = 0
    @individual_category_deductionable = 0
    @individual_payslip_category.each do |pc|
      unless pc.is_deduction == true
        @individual_category_non_deductionable = @individual_category_non_deductionable + pc.amount.to_i
      end
    end

    @individual_payslip_category.each do |pc|
      unless pc.is_deduction == false
        @individual_category_deductionable = @individual_category_deductionable + pc.amount.to_i
      end
    end

    @non_deductionable_amount = 0
    @deductionable_amount = 0
    @monthly_payslips.each do |mp|
      category1 = PayrollCategory.find(mp.payroll_category_id)
      unless category1.is_deduction == true
        @non_deductionable_amount = @non_deductionable_amount + mp.amount.to_i
      end
    end

    @monthly_payslips.each do |mp|
      category2 = PayrollCategory.find(mp.payroll_category_id)
      unless category2.is_deduction == false
        @deductionable_amount = @deductionable_amount + mp.amount.to_i
      end
    end

    @net_non_deductionable_amount = @individual_category_non_deductionable + @non_deductionable_amount
    @net_deductionable_amount = @individual_category_deductionable + @deductionable_amount

    @net_amount = @net_non_deductionable_amount - @net_deductionable_amount
    
    render :pdf => 'individual_payslip_pdf'
    #    respond_to do |format|
    #      format.pdf { render :layout => false }
    #    end
  end
  def advanced_search
    @search = Employee.search(params[:search])
    @sort_order=""
    @sort_order=params[:sort_order] if  params[:sort_order]
    if params[:search]
      if params[:search][:status_equals]=="true"
        @search = Employee.search(params[:search])
        @employees1 = @search.all
        @employees2 = []
      elsif params[:search][:status_equals]=="false"
        @search = ArchivedEmployee.search(params[:search])
        @employees1 = @search.all
        @employees2 = []
      else
        @search1 = Employee.search(params[:search]).all
        @search2 = ArchivedEmployee.search(params[:search]).all
        @employees1 = @search1
        @employees2 = @search2
      end
    end
  end

  def list_doj_year
    doj_option = params[:doj_option]
    if doj_option == "equal_to"
      render :update do |page|
        page.replace_html 'doj_year', :partial=>"equal_to_select"
      end
    elsif doj_option == "less_than"
      render :update do |page|
        page.replace_html 'doj_year', :partial=>"less_than_select"
      end
    else
      render :update do |page|
        page.replace_html 'doj_year', :partial=>"greater_than_select"
      end
    end
  end

  def doj_equal_to_update
    year = params[:year]
    @start_date = "#{year}-01-01".to_date
    @end_date = "#{year}-12-31".to_date
    render :update do |page|
      page.replace_html 'doj_year_hidden', :partial=>"equal_to_doj_select"
    end
  end

  def doj_less_than_update
    year = params[:year]
    @start_date = "1900-01-01".to_date
    @end_date = "#{year}-01-01".to_date
    render :update do |page|
      page.replace_html 'doj_year_hidden', :partial=>"less_than_doj_select"
    end
  end

  def doj_greater_than_update
    year = params[:year]
    @start_date = "2100-01-01".to_date
    @end_date = "#{year}-12-31".to_date
    render :update do |page|
      page.replace_html 'doj_year_hidden', :partial=>"greater_than_doj_select"
    end
  end

  def list_dob_year
    dob_option = params[:dob_option]
    if dob_option == "equal_to"
      render :update do |page|
        page.replace_html 'dob_year', :partial=>"equal_to_select_dob"
      end
    elsif dob_option == "less_than"
      render :update do |page|
        page.replace_html 'dob_year', :partial=>"less_than_select_dob"
      end
    else
      render :update do |page|
        page.replace_html 'dob_year', :partial=>"greater_than_select_dob"
      end
    end
  end

  def dob_equal_to_update
    year = params[:year]
    @start_date = "#{year}-01-01".to_date
    @end_date = "#{year}-12-31".to_date
    render :update do |page|
      page.replace_html 'dob_year_hidden', :partial=>"equal_to_dob_select"
    end
  end

  def dob_less_than_update
    year = params[:year]
    @start_date = "1900-01-01".to_date
    @end_date = "#{year}-01-01".to_date
    render :update do |page|
      page.replace_html 'dob_year_hidden', :partial=>"less_than_dob_select"
    end
  end

  def dob_greater_than_update
    year = params[:year]
    @start_date = "2100-01-01".to_date
    @end_date = "#{year}-12-31".to_date
    render :update do |page|
      page.replace_html 'dob_year_hidden', :partial=>"greater_than_dob_select"
    end
  end

  def remove
    @employee = Employee.find(params[:id])
    associate_employee = Employee.where("reporting_manager_id=?",@employee.id)
    unless associate_employee.blank?
      flash[:notice] = t('flash35')
      redirect_to :action=>'remove_subordinate_employee', :id=>@employee.id
    end
  end

  def remove_subordinate_employee
    @current_manager = Employee.find(params[:id])
    @associate_employee = Employee.where("reporting_manager_id= ?",@current_manager.id)
    @departments = EmployeeDepartment.all
    @categories  = EmployeeCategory.all
    @positions   = EmployeePosition.all
    @grades      = EmployeeGrade.all
    if request.post?
      @associate_employee.each do |e|
        Employee.update(e, :reporting_manager_id => params[:employee][:reporting_manager_id])
      end
      redirect_to :action => "remove", :id=>@current_manager.id
    end
  end

  def change_to_former
    @employee = Employee.find(params[:id])
    @dependency = @employee.former_dependency
    if request.post?
      flash[:notice]= "#{t('flash32')}  #{@employee.employee_number}"
      EmployeesSubject.destroy_all(:employee_id=>@employee.id)
      @employee.archive_employee(params[:remove][:status_description])
      redirect_to :action => "hr"
    end
  end

  def delete
    employee = Employee.find(params[:id])
    unless employee.has_dependency
      employee_subject=EmployeesSubject.destroy_all(:employee_id=>employee.id)
      employee.user.destroy
      employee.destroy
      flash[:notice] = "#{t('flash46')}#{employee.employee_number}."
      redirect_to :controller => 'user', :action => 'dashboard'
    else
      flash[:notice] = "#{t('flash44')}"
      redirect_to  :action => 'remove' ,:id=>employee.id
    end
  end

  def advanced_search_pdf
    @employee_ids2 = params[:result2]
    @employee_ids = params[:result]
    @searched_for = params[:for]
    @status = params[:status]
    @employees1 = []
    @employees2 = []
    if params[:status] == 'true'
      @employee_ids.each do |s|
        employee = Employee.find(s)
        @employees1.push employee
      end
    elsif params[:status] == 'false'
      @employee_ids.each do |s|
        employee = ArchivedEmployee.find(s)
        @employees1.push employee
      end
    elsif @employee_ids.present?
      @employee_ids.each do |s|
        employee = Employee.find(s)
        @employees1.push employee
      end
      unless @employee_ids2.nil?
        @employee_ids2.each do |s|
          employee = ArchivedEmployee.find(s)
          @employees2.push employee
        end
      end
    end
    render :pdf => 'employee_advanced_search_pdf'
  end


  def payslip_approve
    @salary_dates = MonthlyPayslip.select("distinct salary_date")
  end

  def one_click_approve
    @dates = MonthlyPayslip.find_all_by_salary_date(params[:salary_date],:conditions => ["is_approved = false"])
    @salary_date = params[:salary_date]
    render :update do |page|
      page.replace_html "approve",:partial=> "one_click_approve"
    end
  end

  def one_click_approve_submit
    dates = MonthlyPayslip.where("salary_date = ?",Date.parse(params[:date]))

    dates.each do |d|
      d.approve(current_user.id)
    end
    flash[:notice] = t('flash34')
    redirect_to :action => "hr"

  end

end
