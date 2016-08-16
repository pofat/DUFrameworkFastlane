module Fastlane
  module Actions
    class DuGitMergeAction < Action
      def self.run(params)
        # construct our command as an array of components
        commands = [
          'git',
          'merge'
        ]

        if params[:no_forward] == true
          commands << "--no-ff"
        end

        commands << "#{params[:branch_to_merge]}"
        commands << "-m \"Merge branch '#{params[:branch_to_merge]}'\""
        # execute our command
        Actions.sh('pwd')

        Actions.sh(commands.join(' '))
        Helper.log.info "Successfully merged branch #{params[:branch_to_merge]}."
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Merge givne branch with or without fast forward'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :branch_to_merge,
                                       env_name: "FL_GIT_MERGE_BRANCH",
                                       description: "The branch name that needs to be merged",
                                       is_string: true,
                                       default_value: "master"),
         FastlaneCore::ConfigItem.new(key: :no_forward,
                                      env_name: "FL_GIT_NOFORWARD",
                                      description: "The bool of if not forwarding merge",
                                      is_string: false,
                                      default_value: "master")
        ]
      end

      def self.authors
        ["pofattseng"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
