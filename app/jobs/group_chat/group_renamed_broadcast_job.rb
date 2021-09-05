# frozen_string_literal: true

module GroupChat
  class GroupRenamedBroadcastJob < BaseBroadcastJob
    GROUP_RENAMED_TYPE = 'group_renamed'
    private_constant :GROUP_RENAMED_TYPE

    attr_reader :group_id

    def perform(group_id)
      @group_id = group_id

      if group
        broadcast_data
      else
        log_error
      end
    end

    private

    def content_json
      { group_id: group_id, name: group.name }
    end

    def job_type
      GROUP_RENAMED_TYPE
    end

    def group
      @group ||= Group.find_by(id: group_id)
    end

    def log_error
      Rails.logger.fatal("group with id: #{group_id} - not found")
    end
  end
end
