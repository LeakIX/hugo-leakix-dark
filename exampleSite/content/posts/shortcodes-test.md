---
title: 'Shortcodes Test'
date: 2025-10-06
draft: false
description: 'Testing all custom shortcodes implementation'
categories: ['Test']
tags: ['shortcodes']
---

# Shortcodes Test Page

This page tests all custom shortcodes from the prompt.

## Tip Shortcode Tests

### Default Info Style

{{< tip >}} Notice how phrase with spaces are enclosed between double quotes
(`"`) to make it a single term. {{< /tip >}}

### Warning Style

{{< tip "warning" >}} Alerting is available for pro users only. See our various
[plans](https://leakix.net/plans) to get access. {{< /tip >}}

## Button Shortcode Tests

{{< button "#" "Read the Docs" >}}

{{< button "#" "Get started" >}}

{{< button "#" "Check the syntax" >}}

## Block and Column Grid Test

{{< block "grid-2" >}} {{< column >}}

# Welcome to LeakIX documentation.

LeakIX (/liːk aɪ eks/) is a red-team search engine indexing mis-configurations
and vulnerabilities online.

This website contains documentation on how to use the engine and its features.

{{< button "#" "Read the Docs" >}} {{< /column >}}

{{< column >}} ![diy](/hugo-leakix-dark/images/leakix-welcome.png)
{{< /column >}} {{< /block >}}

## Multiple Tips Test

{{< tip >}} This is a regular tip with **markdown** support including `code`
snippets. {{< /tip >}}

{{< tip "warning" >}} This is a **warning** with markdown and a
[link](https://example.com). {{< /tip >}}
