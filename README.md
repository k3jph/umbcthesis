### What is this repository for?

This repository contains a style file for a UMBC thesis or dissertation.
This is derived from James P. Howard, II's 2014 dissertation.  This
repository also contains a simple sample dissertation to provide a
framework for writing one in this format.

### How to Download

* Via HTTP by [downloading a release from GitHub](https://github.com/howardjp/umbcthesis/releases)
* You can download this repository using [git](http://git-scm.com):

> ``git clone https://github.com/howardjp/umbcthesis.git``

### Usage

* Open dissertation with ``\documentclass[phd]{umbcthesis}``
  * You can replace ``phd`` with ``ms``, ``ma``, ``mpp``, or ``mfa`` as appropriate
  * Replacing ``phd`` also changes "dissertation" to "thesis" on the title page
  * Specifying ``proposal`` as an option will change the thesis/dissertation into a proposal
  * Specifying ``draft`` will turn on draft mode

* Before ``\begin{document}``, set the following metadata:
  * Title: ``\title{My Dissertation Title}``
  * Author: ``\author{Morgan Q. Student}``
  * Year: ``\date{2020}``
  * Keywords: ``\keywords{keyword one, keyword two, keyword three}``
  * Subject areas: ``\subjects{subject one, subject two}``
  * Advisor's name: ``\advisor{Taylor Q. Advisor}``
  * Advisor's title: ``\advisortitle{Professor}``
  * Advisor's department: ``\dept{Department of Redundancy Department}``
  * Run ``\makemetadata`` to produce the meta data

### Contribution Guidelines & To Do

Right now, this package is missing some critical artifacts.
Contributions to this effort are welcome:
 
* Code review
* Development of a LaTeX standard package
* Documentation for the package

### Contacts

* James P. Howard, II <jh@jameshoward.us>
* [Public Trello board](https://trello.com/b/IL0oRlIz/umbc-thesis-style)
