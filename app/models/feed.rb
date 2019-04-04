class Feed < ApplicationRecord

  URLS = {
    "Programming" => 'https://weworkremotely.com/categories/remote-programming-jobs.rss',
    "Copywriting" => 'https://weworkremotely.com/categories/remote-copywriting-jobs.rss',
    "Design" => 'https://weworkremotely.com/categories/remote-design-jobs.rss',
    "Sales & marketing" => 'https://weworkremotely.com/categories/sales-and-marketing.rss',
    "Business & management" => 'https://weworkremotely.com/categories/business-and-management.rss',
    "Customer support" => 'https://weworkremotely.com/categories/remote-customer-support-jobs.rss',
    "Product" => 'https://weworkremotely.com/categories/product.rss',
    "Devops & sysadmin" => 'https://weworkremotely.com/categories/remote-devops-sysadmin-jobs.rss',
    "Finance & legal" => 'https://weworkremotely.com/categories/finance-and-legal.rss',
    "All other" => 'https://weworkremotely.com/categories/remote-jobs.rss'
  }
end
