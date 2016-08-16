module Fastlane
  module Actions
    class DuCreateReleaseBranchAction < Action
      def self.run(params)
        release_branch = params[:release_branch]

        # construct our command as an array of components
        commands = [
          'git',
          'checkout',
          '-b',
          release_branch
        ]

        # execute our command
        Actions.sh('pwd')

        Actions.sh(commands.join(' '))
        Helper.log.info "Successfully created and checkout branch #{release_branch}."
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Create and checkout a release branch.'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :release_branch,
                                       env_name: "FL_GIT_CREATE_RELEASH_BRANCH",
                                       description: "The relase branch name that needs to be created",
                                       is_string: true,
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
