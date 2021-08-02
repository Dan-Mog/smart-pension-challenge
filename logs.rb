class Logs
  def self.most_page_views(file_path)
    read_logs(file_path)
    # create a hash to document the number of times a page is visited
    log_list = Hash.new(0)
    # iterate through the logs to remove the ip_address and add the webpage and number of times it is visited to the hash
    @logs.each do |log|
      new_log = log.split.first
      log_list[new_log] += 1
    end
    # sort the list in descending order
    ordered_list = log_list.sort_by { |_page, number| -number }
    # display the list in a readable format
    ordered_list.each { |page, number| puts "#{page} #{number} views" }
  end

  def self.most_unique_views(file_path)
    read_logs(file_path)
    log_list = Hash.new(0)
    # remove all duplicate views
    unique_logs = @logs.uniq
    unique_logs.each do |log|
      new_log = log.split.first
      log_list[new_log] += 1
    end
    ordered_list = log_list.sort_by { |_page, number| -number }
    ordered_list.each { |page, number| puts "#{page} #{number} unique views" }
  end

  def self.read_logs(file_path)
    # read the log file and return as an array
    @logs = File.readlines file_path
  end

  puts 'Ordering logs by most page views...'
  Logs.most_page_views('webserver.log')

  puts 'Ordering logs by most unique page views'
  Logs.most_unique_views('webserver.log')
end
