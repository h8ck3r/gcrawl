package main

import (
	""
)

type crawler struct {
	urls []string

}

func NewCrawler(urls []string) *crawler {
	return &crawler{urls:urls}
}

func (c *crawler) crawl() error {
	return nil
}

func main() {
	c := NewCrawler([]string{})
}