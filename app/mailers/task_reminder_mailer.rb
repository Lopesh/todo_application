class TaskReminderMailer < ApplicationMailer
  def send_reminder
    @task = params[:next_task]
    mail(to: @task.user.email, subject: "Gentle Reminder for Task Deadline")
  end
end
