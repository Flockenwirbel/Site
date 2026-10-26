# frozen_string_literal: true

require "cgi"
require "json"

module EnglishUrls
  TAG_SLUGS = {
    "数学物理方法" => "mathematical-methods-in-physics",
    "分析力学" => "analytical-mechanics",
  }.freeze

  # Both the archive generator and Chirpy's links use this slug helper.
  module TagSlugs
    def slugify(string, **options)
      super(EnglishUrls::TAG_SLUGS.fetch(string, string), **options)
    end
  end

  class Redirects < Jekyll::Generator
    safe true
    priority :lowest

    def generate(site)
      redirects = site.posts.docs.flat_map do |post|
        Array(post.data["redirect_from"]).map { |old| [old, post.url] }
      end
      TAG_SLUGS.each do |label, slug|
        redirects << ["/tags/#{label}/", "/tags/#{slug}/"]
      end

      redirects.each do |old, target|
        next if old == target

        destination = "#{site.baseurl}#{target}"
        absolute = "#{site.config['url']}#{destination}"
        page = Jekyll::PageWithoutAFile.new(site, site.source, old.delete_prefix("/"), "index.html")
        page.data.merge!("layout" => nil, "sitemap" => false)
        page.content = <<~HTML
          <!doctype html>
          <html lang="en">
          <head>
            <meta charset="utf-8">
            <title>Page moved</title>
            <meta name="robots" content="noindex">
            <link rel="canonical" href="#{CGI.escapeHTML(absolute)}">
            <meta http-equiv="refresh" content="0; url=#{CGI.escapeHTML(destination)}">
            <script>location.replace(#{destination.to_json} + location.search + location.hash);</script>
          </head>
          <body><a href="#{CGI.escapeHTML(destination)}">Continue to the new address</a></body>
          </html>
        HTML
        site.pages << page
      end
    end
  end
end

Jekyll::Utils.singleton_class.prepend(EnglishUrls::TagSlugs)
