# -*- coding: utf-8 -*-

import os
import sqlite3
import csv

def build(table_name, csv_file):
    print 'Creating for %s.' % table_name
    
    # Database Connect
    con = sqlite3.connect(DATABASE_FILE)
    con.text_factory = str
    
    # Load File
    data = []
    with open(csv_file,'r') as f:
        next(f) # skip headings
        reader=csv.reader(f,delimiter='\t')
        for row in reader:
            data.append(row)
    
    # Create Table
    con.execute('CREATE TABLE IF NOT EXISTS %s (id INTEGER PRIMARY KEY AUTOINCREMENT, new_character TEXT, old_character TEXT, total_strokes INTEGER, grade TEXT, add_year INTEGER, reading TEXT);' % table_name)
    
    # Insert Data
    for row in data:
        con.execute('INSERT INTO %s (new_character, old_character, total_strokes, grade, add_year, reading) VALUES (?, ?, ?, ?, ?, ?)' % table_name, (row[0],row[1],row[2],row[3],row[4],row[5]))
    
    # Results
    c = con.cursor()
    c.execute('SELECT count(*) FROM %s' % table_name)
    print 'Counts: %d' % c.fetchone()[0]
    
    c = con.cursor()
    c.execute('SELECT * FROM %s ORDER BY id DESC LIMIT 1' % table_name)
    print 'Last Result:'
    print 'ID:%d %s %s %s %s %s %s' % c.fetchone()
    
    # Commit
    con.commit()
    
    # Database Close
    con.close()

BASE_DIR = './'
DATABASE_FILE = BASE_DIR + 'kanji_reading.db'
INIT_DATABASE = True

# Remove if exists
if os.path.exists(DATABASE_FILE) and INIT_DATABASE:
    os.remove(DATABASE_FILE)

build('joyo2010', BASE_DIR + 'joyo2010.txt')

print 'Done.'