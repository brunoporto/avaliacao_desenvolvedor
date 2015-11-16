module Exceptions
  class EmptyFile < StandardError; end
  class BlankFile < AuthenticationError; end
  class OnlyColumnNames < AuthenticationError; end
  class DontHaveSixColumns < AuthenticationError; end
end