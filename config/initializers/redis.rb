$redis = Redis::Namespace.new('questionator', :redis => Redis.new)