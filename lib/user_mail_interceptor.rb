class UserMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = "shivakumar.gouda@gmail.com"
    message.from = "rahuldesai017@gmail.com"
  end
  
end