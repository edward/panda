# merb -r "panda/lib/notifier.rb"

# How notification works:
# 
# Once a video has been encoded, its next_notification field is set to the current time and returned by Video.outstanding_notifications, which is picked up by the notifier, which calls send_notification on its parent.
# 
# A notification is sent to the client with full details for the parent and all of its encoding. The response is checked for the string 'success' and a 200 response. If both are are not returned, an error is logged, and the next_notification field set to a few seconds in the future. Further notifications are sent until success is returned from the client.

Merb.logger.info 'Notifier awake!'
loop do
  sleep 3
  Merb.logger.debug "Checking for messages... #{Time.now}"
  if encodings = Video.outstanding_notifications
    encodings.each do |encoding|
      begin
        encoding.send_notification if encoding.time_to_send_notification?
      rescue
        Merb.logger.info "ERROR (#{$!.to_s}) sending notification for #{encoding.key}. Waiting #{encoding.notification_wait_period}s before trying again."
      end
      sleep 1
    end
  end
end