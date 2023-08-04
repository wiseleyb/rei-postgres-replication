# frozen_string_literal: true
# You can override these methods to do things like ping Slack, retart
# crashed things, handle errors, handle logging, handle all replicaiton events
# (instead of doing this in models)
class KoyoReplHandlerService < Koyo::Repl::EventHandlerService
  class << self
    # This is called for every create/update/delete action called on any table
    # This can be used if you want to process all replication in one place
    # instead of using the model level mixins. See README
    # For an app with a lot of DB churn you want this to be as fast as possible
    # You don't want do API calls from here, and shouldn't do DB updates from
    # here (but if you do, be super careful of infinite loops)
    def koyo_handle_all_replication(row)
      case row.table
      when 'users'
        puts ''
        puts '-' * 80
        puts 'KoyoReplHandlerService.koyo_handl_all_replication'
        puts row.to_yaml
        puts '-' * 80
      end
      super
    end

    # Called whenever an error is raised in Koyo::Repl code
    # Examples would be to log to Slack, or restart something that's crashed
    # def koyo_error(err)
    #   super
    # end

    # log_level: :debug, :info, :warn, :error, :fatal
    # Example of message
    # source=KoyoReplication logid=d7f1f0bb2a
    #   message=Init: Finding models that support koyo_repl_handler
    # You can use this as a catch all for any log event or use methods
    # below if that's easier. You could use this for monitoring type activites
    # def koyo_log_event(message, log_level)
    #   super
    # end

    # Called whenever Rails.logger.debug is called from Koyo::Repl code
    # def koyo_log_event_debug(message)
    #   super
    # end

    # Called whenever Rails.logger.debug is called from Koyo::Repl code
    # def koyo_log_event_info(message)
    #   super
    # end

    # Called whenever Rails.logger.debug is called from Koyo::Repl code
    # def koyo_log_event_warn(message)
    #   super
    # end

    # Called whenever Rails.logger.debug is called from Koyo::Repl code
    # def koyo_log_event_error(message)
    #   super
    # end

    # Called whenever Rails.logger.debug is called from Koyo::Repl code
    # def koyo_log_event_fatal(message)
    #   super
    # end
  end
end
