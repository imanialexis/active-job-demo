# README


## What It Is
Active Job is a framework for declaring jobs and making them run on a variety of queuing backends. These jobs can be everything from regularly scheduled clean-ups, to billing charges, to mailings.

## Why It’s Useful
As developers, we’re always striving to give our users a better experience when they use our website or application. One of the most important ways to achieve this is by giving them quick server response times. Rails Active Job to enable us to do this through the use of a queuing system. You can also use queues to help normalize traffic spikes or load on the server

The Active Job Async adapter runs jobs with an in-process thread pool.
*This is the default queue adapter*. It's well-suited for dev/test since it doesn't need an external infrastructure, but it's a poor fit for production since it drops pending jobs on restart.

Active Job comes equipped with adapters for variety of queueing adapters including:
* Backburner
* Delayed Job
* Qu
* Que
* Resque
* Sidekiq
* Sucker Punch
* among several others

These adapters differ in terms of their backend features such as:
* Async (allows jobs to run on a separate process or a different thread)
* Queues (allows setting of which queue with which job should be run)
* Delayed (allows job to run in the future via perform_later method)
* Priorities (allows order in which jobs processed to be configured)
* Timeout (allows job to be stop after allotted time)
* Retries (allows number of retries to be set on job class)
Your adapter can be set in the config/application.rb file via 
  config.active_job.queue_adapter = :sidekiq

# How-to
1. Create a new rails app
2. Generate new rails job 
    rails g job name    
Which autogenerates jobs folder
3. In your class
```ruby
class FirstJob < ActiveJob::Base
queue_as :default

  def perform(args)
    #Whatever you want to do goes here
  end
end
```
    
4. Scaffold
5. Enqueue job:
* `:wait` - enqueues the job with the specified delay;
* `:wait_until` - enqueues the job at the time specified (override :wait if both specified;
* `:queue` - enqueues the job on the specified queue
Ex. 
```ruby
FirstJob.perform_later()
FirstJob.set(wait_until: Date.tomorrow.noon).perform_later()
FirstJob.set(wait: 1.week).perform_later()
```


## Real World Applications
Active Job can be used for a variety of background jobs including:
* Bulk Email reports
* Updating database counts
* Geocode
* Subscribe & unsubscribe from mailing list
* Fetch API data
* Push notifications to devises
* Export CSV data
* and more!
