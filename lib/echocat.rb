# frozen_string_literal: true

require 'csv'
require_relative 'csv_to_hash'
class Echocat
  attr_accessor :end_program

  def initialize
    @authors = get_authors
    @publications = get_publications
  end

  def run
    print_options
    options
  end

  def start
    puts
    puts "~~Welcome to Echocat~~"
    puts
  end

  def print_options
    puts "Choose your option:"
    puts "1: Print publications"
    puts "2: Find publication by ISBN"
    puts "3: Find by authors email"
    puts "4: Print publications sorted by title"
    puts "0: Exit"
  end

  def options
    user_input = gets.chomp
    case user_input
    when '1'
      puts
      puts @publications
      puts
    when '2'
      puts
      puts "Type the ISBN"
      puts
      isbn = gets.chomp.strip
      results = @publications.select { |publication| publication["isbn"] == isbn }
      if results.empty?
        puts
        puts "PUBLICATION NOT FOUND!"
        puts
      else
        puts
        puts results
        puts
      end
    when '3'
      puts
      puts "Type the author email"
      puts
      email = gets.chomp.strip
      results = @publications.select { |publication| publication["authors"].include? email }
      if results.empty?
        puts
        puts "PUBLICATION NOT FOUND!"
        puts
      else
        puts
        puts results
        puts
      end
    when '4'
      puts
      puts @publications.sort_by { |publication| publication["title"] }
      puts
    when '0'
      @end_program = true
      puts "BYE!"
    else
      puts "INVALID OPTION!"
      puts ""
    end
  end

private
  def get_publications
    books = CsvToHash.convert(File.open('../data/books.csv', "r:bom|utf-8"))
    magazines = CsvToHash.convert(File.open('../data/magazines.csv', "r:bom|utf-8"))
    publications = books + magazines

    publications.map do |publication|
      publication["authors"] = publication["authors"].split(',')
    end

    publications
  end

  def get_authors
    CsvToHash.convert(File.open('../data/authors.csv', "r:bom|utf-8"))
  end
end
