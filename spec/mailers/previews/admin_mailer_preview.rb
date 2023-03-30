# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

    def admin_order_email
        AdminMailer.admin_order_email(Order.first)
    end

end
