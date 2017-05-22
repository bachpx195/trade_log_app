class Log < ApplicationRecord
  enum status: {unsuccess: 0, success: 1}
end
