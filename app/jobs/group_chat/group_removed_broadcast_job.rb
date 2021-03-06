# frozen_string_literal: true

module GroupChat
  class GroupRemovedBroadcastJob < BaseBroadcastJob
    GROUP_REMOVED_TYPE = 'group_removed'
    private_constant :GROUP_REMOVED_TYPE

    attr_reader :group_id

    def perform(group_id)
      @group_id = group_id

      broadcast_data
    end

    private

    def content_json
      {}
    end

    def job_type
      GROUP_REMOVED_TYPE
    end
  end
end
