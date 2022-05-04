namespace :tasks do
  desc "sending email to member"
  task send_reminder: :environment do
    next_day_tasks = Task.except_done_tasks.next_day_and_hour_tasks
    if next_day_tasks
      next_day_tasks.each do |next_day_task|
        TaskReminderMailer.with(next_task: Task.first).send_reminder.deliver_now   
      end
    end
  end
end
