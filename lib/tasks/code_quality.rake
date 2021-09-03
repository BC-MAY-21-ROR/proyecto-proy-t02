if Rails.env.development?
  require 'rubycritic_small_badge'
  require 'rubycritic/rake_task'
  require 'sandi_meter/file_scanner'

  { spec: 65, app: 90 }.each do |dir, percentage|
    RubyCriticSmallBadge.configure do |config|
      config.minimum_score = percentage
      config.output_path = "badges/#{dir}"
    end

    RubyCritic::RakeTask.new("rubycritic:#{dir}") do |task|
      task.options = %(
        --custom-format RubyCriticSmallBadge::Report
        --minimum-score #{RubyCriticSmallBadge.config.minimum_score}
        --format html
        --path tmp/rubycritic/#{dir}
        --format console
      )
      task.paths = FileList["#{dir}/**/*.rb"]
    end
    Rake::Task["rubycritic:#{dir}"].invoke
  end

  task :sandi_meter do
    pp `sandi_meter -dg -o tmp/sandi_meter`
  end

  task code_quality: %i[rubycritic:spec rubycritic:app sandi_meter]
end
