module Lograge
  module Instrumentation
    module ActionCable
      def handle_open
        ActiveSupport::Notifications.instrument('connect.action_cable', notification_payload('connect')) { super }
      end

      def handle_close
        ActiveSupport::Notifications.instrument('disconnect.action_cable', notification_payload('disconnect')) { super }
      end

      def notification_payload(method_name)
        { connection_class: self.class.name, action: method_name, data: request.params }
      end
    end
  end
end
