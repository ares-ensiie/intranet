class Trombi::TrombiController < ApplicationController
  prepend_before_filter :authenticate_user!
end
