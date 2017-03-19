package main

import (
	"fmt"
	"gopkg.in/gin-gonic/gin.v1"
)

func main() {
	fmt.Println("Starting Web Server using Gin Framework......")
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
        	c.JSON(200, gin.H{
            		"message": "pong",
        	})
    	})
    	r.Run() 

}
