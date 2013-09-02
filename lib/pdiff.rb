require 'subexec'
require 'pry'
require "pdiff/version"


module Pdiff

  class Error < RuntimeError; end
  class Invalid < StandardError; end

  class Comparator

    attr_reader :ran
    attr_reader :baseline
    attr_reader :current

    def initialize(baseline, current)
      @baseline = baseline
      @current = current
      @diff = []
      @ran = false
    end

    def matches?
      run
    end

    def run(output_image="diff.png")
      @diff = []
      command = "compare"
      command << " -fuzz 20% -highlight-color blue" # -metric AE
      command << " #{@baseline} #{@current}"
      command << " #{output_image}"
      # command << " 2>&1"
      @diff = run_command command
      @ran = true
      @diff.to_i == 0
    end

    def run_command(command)
      # Minimagick
      sub = Subexec.run command, :timeout => 5

      if sub.exitstatus != 0
        # Clean up after ourselves in case of an error
        # TODO destroy temp file

        # Raise the appropriate error
        if sub.output =~ /no decode delegate/i || sub.output =~ /did not return an image/i
          raise Invalid, sub.output
        else
          # TODO: should we do something different if the command times out ...?
          # its definitely better for logging.. otherwise we dont really know
          raise Error, "ImageMagick comparison failed:
                        #{{:status_code => sub.exitstatus, :output => sub.output}.inspect}
                        with command : (#{command.inspect.gsub("\\", "")})"
        end
      else
        sub.output
      end
    end

  end

end
