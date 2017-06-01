# SequelStore

Tiny extension for Sequel to add store_accessor capabilities similar to ActiveRecord::Store: http://api.rubyonrails.org/classes/ActiveRecord/Store.html

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sequel-store'
```

And then add extension to Sequel:

```
  Sequel.extension :store_accessor
```

Now define your accessors in `Sequel::Model` classes:

```
class Article < Sequel::Model(:articles)
  store_accessor :metadata, :year, :rating, :views_count

  def views_count
    super || 0
  end
end
```

```
article = Article.new
article.year #=> nil
article.year = 2017
article.year #=> 2017
article.views_count #=> 0
article.metadata #=> {"year"=>2017}
```

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kressh/sequel-store.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

