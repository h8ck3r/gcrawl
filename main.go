package main

import (
	"github.com/sirupsen/logrus"
)

type crawler struct {
	urls []string
}

func NewCrawler(urls []string) *crawler {
	return &crawler{urls:urls}
}

func (c *crawler) run() error {
	return nil
}

func main() {
	c := NewCrawler([]string{})
	if err := c.run(); err != nil {
		logrus.Panic(err)
	}
}